class BoardsController < ApplicationController
  before_action :check_user_ownership!, except: [:index, :show]
  before_action :check_user_membership!, only: :show

  def index
    @owned_boards = current_user.owned_boards
    @assigned_boards = current_user.assigned_boards
  end

  def show
    @board = board
  end

  def edit
    @board = board
  end

  def destroy
    if board.destroy
      redirect_to root_path, notice: 'Board successfully deleted.'
    else
      redirect_to root_path, notice: 'Could not delete board.'
    end
  end

  private

  def board
    Board.find_by_uid params[:id]
  end

  def check_user_ownership!
    raise_routing_error if board.nil?
    forbidden unless board.has_owner? current_user
  end

  def check_user_membership!
    raise_routing_error if board.nil?
    forbidden unless board.has_member? current_user
  end
end
