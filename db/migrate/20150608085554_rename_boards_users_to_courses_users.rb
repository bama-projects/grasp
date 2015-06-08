class RenameBoardsUsersToCoursesUsers < ActiveRecord::Migration
  def change
    rename_table :boards_users, :courses_users
  end
end
