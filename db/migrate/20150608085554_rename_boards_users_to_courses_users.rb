class RenamecoursesUsersToCoursesUsers < ActiveRecord::Migration
  def change
    rename_table :courses_users, :courses_users
  end
end
