class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def show
    @course_roles = @course.course_roles
  end

  def archive
    @courses = Course.all
  end

  private

  def find_course
    @course = Course.find params[:id]
  end
end
