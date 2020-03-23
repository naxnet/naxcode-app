class Professors::CoursesController < ApplicationController
  before_action :authenticate_professor!
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "courses", :professors_courses_path

  def index
    @courses = current_professor.courses
  end
  def new
    add_breadcrumb "new", new_professors_course_path

    @course = Course.new
  end

  def show
    add_breadcrumb @course.name, professors_course_path(@course)
  end

  def edit
    add_breadcrumb "edit", edit_professors_course_path
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        current_professor.courses << @course
        format.html { redirect_to professors_courses_url, notice: 'Course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to professors_courses_url, notice: 'Course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to professors_courses_url, notice: 'Course was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name)
    end
end
