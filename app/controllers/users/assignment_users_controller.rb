class Users::AssignmentUsersController < ApplicationController
  before_action :authenticate_user!, except: [:enqueue]
  before_action :set_course
  before_action :set_assignment
  before_action :set_breadcrumbs
  before_action :set_assignment_user, only: [:show]
  protect_from_forgery with: :null_session


  def new
    add_breadcrumb "submit", new_users_course_assignment_assignment_user_path(@course, @assignment)
    @assignment_user = current_user.assignment_users.new(assignment: @assignment)

    @assignment.assignment_files.each do |assignment_file|
      @assignment_user.assignment_user_files.new()
    end
  end

  def create
    assignment_user = current_user.assignment_users.new(assignment_user_params)
    assignment_user.assignment = @assignment

    respond_to do |format|
      if assignment_user.save
        i = 0
        assignment_user.assignment_user_files.each do |assignment_user_file|
          assignment_user_file.file.blob.update(filename: @assignment.assignment_files[i].name)
          i += 1
        end

        assignment_user.review()

        format.html { redirect_to users_course_assignment_path(@course, @assignment), notice: 'assignment_user was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def enqueue
  end

  def show
  end

  private
    def set_breadcrumbs
      add_breadcrumb "courses", :users_courses_path
      add_breadcrumb @course.name, :users_courses_path
      add_breadcrumb "assignment", users_course_assignments_path(@course)
      add_breadcrumb @assignment.name, users_course_assignment_path(@course, @assignment)
    end

    def set_course
      @course = current_user.courses.find(params[:course_id])
    end

    def set_assignment
      @assignment = @course.assignments.find(params[:assignment_id])
    end

    def set_assignment_user
      @assignment = current_user.assignment_users.find(params[:id])
    end

    def assignment_user_params
      params.require(:assignment_user).permit(assignment_user_files_attributes: [
                                                :file,
                                                :assignment_file_id
                                              ])
    end
end
