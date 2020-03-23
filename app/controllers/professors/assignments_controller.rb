class Professors::AssignmentsController < ApplicationController
  before_action :authenticate_professor!
  before_action :set_course
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  def index
    @assignments = @course.assignments
  end
  def new
    add_breadcrumb "new", new_professors_course_assignment_path(@course)
    @assignment = @course.assignments.new
  end

  def show
    add_breadcrumb @assignment.name, professors_course_assignment_path(@course, @assignment)
  end

  def edit
    add_breadcrumb "edit", edit_professors_course_assignment_path(@course)
  end

  def create
    @assignment = @course.assignments.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to professors_course_assignments_path(course: @course), notice: 'Assignment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to professors_course_assignments_path(course: @course), notice: 'Assignment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to professors_course_assignments_path(course: @course), notice: 'Assignment was successfully destroyed.' }
    end
  end

  private
    def set_breadcrumbs
      add_breadcrumb "courses", :professors_courses_path
      add_breadcrumb @course.name, professors_course_path(@course)
      add_breadcrumb "assignment", professors_course_assignments_path(@course)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_assignment
      @assignment = @course.assignments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:name,
                                         :init_time,
                                         :end_time)
    end
end