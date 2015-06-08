class AddUidToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :uid, :string
  end
end
