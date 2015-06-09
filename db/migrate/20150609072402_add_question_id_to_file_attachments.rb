class AddQuestionIdToFileAttachments < ActiveRecord::Migration
  def change
    add_column :file_attachments, :question_id, :integer
  end
end
