class AddDefaultValueToPointFieldInAchievements < ActiveRecord::Migration
  def change
    change_column :achievements, :points, :integer, default: 1
  end
end
