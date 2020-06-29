class CoursesController < ApplicationController
  before_action :authenticate
  before_action :set_course, only: [:show, :edit, :update]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to root_path, notice: 'Course created successfuly'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course updated successfuly'
    else
      render :edit
    end
  end

  private

    def course_params
      params.require(:course).permit(:name, :url, :description, :author)
    end

    def set_course
      @course = Course.find(params[:id])
    end
end
