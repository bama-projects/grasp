class ChangeUserIpsToString < ActiveRecord::Migration
  def self.up
    change_column :users, :last_sign_in_ip, :string
    change_column :users, :current_sign_in_ip, :string
  end

  def self.down
    change_column :users, :last_sign_in_ip, :inet
    change_column :users, :current_sign_in_ip, :inet
  end
end
