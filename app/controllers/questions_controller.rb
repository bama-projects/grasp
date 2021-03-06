class QuestionsController < ApplicationController
  before_action :check_user_course_membership!
  before_action :check_user_author!,   only: [:edit,   :update, :destroy, :mark_as_solved!]
  before_action :check_lecture_scope!, only: [:create, :update]

  def new
    @question = course.questions.new
  end

  def create
    @question        = current_user.questions.new question_params
    @question.course = course

    if @question.save && attach_files_to(@question)
      redirect_to [@question.course, @question], notice: 'Question successfully created.'
    else
      render :new
    end
  end

  def show
    @question    = question
    @new_comment = @question.comments.new
  end

  def edit
    @question = question
  end

  def update
    if question.update_attributes(question_params) && attach_files_to(question)
      redirect_to [question.course, question], notice: 'Question successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if question.destroy
      redirect_to course, notice: 'Question successfully deleted.'
    else
      redirect_to course, notice: 'Could not delete question.'
    end
  end

  def mark_as_solved!
    if question.update_attributes solved: !question.solved
      redirect_to [question.course, question], notice: 'Question successfully updated.'
    else
      redirect_to [question.course, question], alert: 'Could not update question.'
    end
  end

  private

  def attach_files_to(object)
    return true unless file_params
    file_params.each { |file| object.file_attachments.create(file: file) }
  end

  def question
    Question.find_by_uid(params[:id]) || raise_routing_error
  end

  def course
    Course.find_by_uid(params[:course_id]) || raise_routing_error
  end

  def lecture
    Lecture.find(question_params[:lecture_id]) || raise_routing_error
  end

  def question_params
    params.require(:question).permit(:content, :category, :lecture_id, :anonymous)
  end

  def file_params
    params[:files]
  end

  def check_lecture_scope!
    forbidden unless lecture.course === course
  end

  def check_user_author!
    forbidden unless question.has_author? current_user
  end

  def check_user_course_membership!
    return    if     course.is_public?
    forbidden unless course.has_member? current_user
  end
end
