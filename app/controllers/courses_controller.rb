class CoursesController < ApplicationController
  before_action :check_user_ownership!, except: [:index, :new, :create, :edit, :update, :show]
  before_action :check_user_membership!, only: :show

  def index
    @owned_courses = current_user.owned_courses
    @assigned_courses = current_user.assigned_courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.owned_courses.new course_params
    @course.add_members_by_email! course_params[:user_emails]

    if @course.save
      redirect_to @course, notice: 'Course successfully created.'
    else
      render :new
    end
  end

  def edit
    @course = course
  end

  def update
    if course.add_members_by_email!(course_params[:user_emails]) && course.update_attributes(course_params)
      redirect_to course, notice: 'Course successfully updated.'
    else
      render :edit
    end
  end

  def show
    @course = course
  end

  def destroy
    if course.destroy
      redirect_to root_path, notice: 'Course successfully deleted.'
    else
      redirect_to root_path, notice: 'Could not delete course.'
    end
  end

  private

  def course
    Course.find_by_uid params[:id]
  end

  def course_params
    params.require(:course).permit(:owner_id, :title, :description, :public, :user_emails)
  end

  def check_user_ownership!
    raise_routing_error if course.nil?
    forbidden unless course.has_owner? current_user
  end

  def check_user_membership!
    return if course.is_public?
    raise_routing_error if course.nil?
    forbidden unless course.has_member? current_user
  end
end