class QuestionsController < ApplicationController
  before_action :check_user_course_membership!

  def new
    @question = course.questions.new
  end

  def create
    @question        = current_user.questions.new(question_params)
    @question.course = course

    if @question.save
      file_params.each { |file| @question.file_attachments.create(file: file) }

      redirect_to [@question.course, @question], notice: 'Question successfully created.'
    else
      render :new
    end
  end

  private

  def question
    Question.find(params[:id]) || raise_routing_error
  end

  def course
    Course.find_by_uid(params[:course_id]) || raise_routing_error
  end

  def question_params
    params.require(:question).permit(:content, :category, :anonymous)
  end

  def file_params
    params[:files]
  end

  def check_user_course_membership!
    return    if     course.is_public?
    forbidden unless course.has_member? current_user
  end
end
