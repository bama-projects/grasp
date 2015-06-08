class RemoveSubmissionDateFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :submission_until
  end
end
