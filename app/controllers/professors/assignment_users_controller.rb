class Professors::AssignmentUsersController < ApplicationController
  before_action :authenticate_professor!
  before_action :set_course
  before_action :set_assignment
  before_action :set_assignment_user
  before_action :set_breadcrumbs

  def show
    add_breadcrumb "show", professors_course_assignment_assignment_user_path(@course, @assignment, @assignment_user)
  end


  private
    def set_breadcrumbs
      add_breadcrumb "courses", :professors_courses_path
      add_breadcrumb @course.name, professors_course_path(@course)
      add_breadcrumb "assignment", professors_course_assignments_path(@course)
      add_breadcrumb @assignment.name, professors_course_assignment_path(@course, @assignment)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = current_professor.courses.find(params[:course_id])
    end

    def set_assignment
      @assignment = @course.assignments.find(params[:assignment_id])
    end

    def set_assignment_user
      @assignment_user = @assignment.assignment_users.find(params[:id])
    end
end
