class CreateFileAttachments < ActiveRecord::Migration
  def change
    create_table :file_attachments do |t|

      t.timestamps null: false
    end
  end
end
