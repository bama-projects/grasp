class CommentsController < ApplicationController
  before_action :check_user_ownership!, except: [:create]
  before_action :check_user_membership!

  def create
    comment          = current_user.comments.new comment_params
    comment.question = question
    comment.course   = course

    if comment.save
      redirect_to [comment.course, comment.question], notice: 'Comment successfully created.'
    else
      redirect_to [comment.course, comment.question], notice: 'Could not create comment.'
    end
  end

  def mark_as_helpful!
    if comment.update_attributes verified: !comment.verified
      redirect_to [comment.question.course, comment.question], notice: 'Comment successfully updated.'
    else
      redirect_to [comment.question.course, comment.question], alert: 'Could not update comment.'
    end
  end

  private

  def comment
    Comment.find(params[:id]) || raise_routing_error
  end

  def course
    Course.find_by_uid(params[:course_id]) || raise_routing_error
  end

  def question
    Question.find_by_uid(params[:question_id]) || raise_routing_error
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def check_user_ownership!
    forbidden if comment.has_author? current_user
  end

  def check_user_membership!
    return    if     course.is_public?
    forbidden unless course.has_member? current_user
  end
end
