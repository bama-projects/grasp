class BoardsController < ApplicationController
  def index
    @owned_boards = current_user.owned_boards
  end
end
