class ChangeBoardIdToCourseId < ActiveRecord::Migration
  def change
    rename_column :courses_users, :board_id, :course_id
  end
end
