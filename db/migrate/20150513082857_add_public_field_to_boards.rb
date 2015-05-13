class AddPublicFieldToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :public, :boolean, default: false
  end
end
