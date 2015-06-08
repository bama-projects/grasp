class RenameBoardsToCourses < ActiveRecord::Migration
  def change
    rename_table :boards, :courses
  end
end
