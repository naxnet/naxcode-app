class Professors::AssignmentsController < ApplicationController
  before_action :authenticate_professor!
  before_action :set_course
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def index
    @assignments = @course.assignments
  end
  def new
    @assignment = @course.assignments.new
  end

  def show
  end

  def edit
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
