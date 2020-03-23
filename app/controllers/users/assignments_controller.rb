class Users::AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course
  before_action :set_assignment, only: [:show]
  before_action :set_breadcrumbs


  def index
    time = Time.now
    @active_assignments = @course.assignments.active(time)
    @deactivated_assignments = @course.assignments.deactivated(time)
    @to_activate_assignments = @course.assignments.to_activate(time)
  end

  def show
    add_breadcrumb @assignment.name, users_course_assignment_path(@course, @assignment)
  end

  private
    def set_breadcrumbs
      add_breadcrumb "courses", :users_courses_path
      add_breadcrumb @course.name, :users_courses_path
      add_breadcrumb "assignment", users_course_assignments_path(@course)
    end

    def set_course
      @course = current_user.courses.find(params[:course_id])
    end

    def set_assignment
      @assignment = @course.assignments.find(params[:id])
    end
end
