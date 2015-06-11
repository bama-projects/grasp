class AddCommentsToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :comment, index: true
    add_foreign_key :comments, :comments
  end
end
