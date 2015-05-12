class CreateBoardsUsers < ActiveRecord::Migration
  # Creates a table for a many to many relationship between boards and users
  # Taken from http://stackoverflow.com/a/6561347 | Dex | 12th May 2015, 11:33 am
  def change
    create_table :boards_users, id: false do |t|
      t.references :board
      t.references :user
    end

    add_index :boards_users, [:board_id, :user_id]
    add_index :boards_users, :user_id
  end
end
