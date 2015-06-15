class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :title
      t.text :description
      t.integer :points
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
