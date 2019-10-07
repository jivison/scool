class CoursesController < ApplicationController

  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.new
    render :new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:notice] = "Course created successfully"
      redirect_to courses_path(@course)
    else
      render :new
    end
  end

  def index
    @courses = Course.all
  end

  def show
    #@course = Course.find(params[:id])
    #@course_assignment = Course_Assignment.new
    @course_assignments = @course.course_assignments
  end

  def edit
  end

  def update
    if @course.update course_params
      redirect_to course_path(@course)
    else 
      render:edit
    end
  end

  def destroy
    flash[:notice] = "Course deleted"
    @course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :status, :course_type, :start_date, :end_date)
  end

  def find_course
    @course = Course.find params[:id]
  end
end
