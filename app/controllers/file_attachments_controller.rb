class FileAttachmentsController < ApplicationController
  before_action :check_user_ownership!

  def destroy
    if file_attachment.destroy
      redirect_to request.referer, notice: 'File successfully deleted.'
    else
      redirect_to request.referer, notice: 'Could not delete file.'
    end
  end

  private

  def file_attachment
    FileAttachment.find params[:id]
  end

  def check_user_ownership!
    forbidden unless file_attachment.question.has_author? current_user
  end
end
