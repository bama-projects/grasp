class RenamecoursesToCourses < ActiveRecord::Migration
  def change
    rename_table :courses, :courses
  end
end
