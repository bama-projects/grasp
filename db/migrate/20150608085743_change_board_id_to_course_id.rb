class ChangecourseIdToCourseId < ActiveRecord::Migration
  def change
    rename_column :courses_users, :course_id, :course_id
  end
end
