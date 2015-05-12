class BoardsController < ApplicationController
  before_action :check_user_permissions!, except: :index

  def index
    @owned_boards = current_user.owned_boards
    @assigned_boards = current_user.assigned_boards
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
    Board.find params[:id]
  end

  def check_user_permissions!
    forbidden if board.owner != current_user
  end
end
