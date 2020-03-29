class Users::AssignmentUsersController < ApplicationController
  before_action :authenticate_user!, except: [:result, :result_zip, :compilation_error]
  before_action :set_course, except: [:result, :result_zip, :compilation_error]
  before_action :set_course_for_result, only: [:result, :result_zip, :compilation_error]
  before_action :set_assignment
  before_action :set_breadcrumbs
  before_action :set_assignment_user, only: [:show, :mark_as_final]
  before_action :set_assignment_user_for_result, only: [:result, :result_zip, :compilation_error]
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

  def mark_as_final
    @assignment_user.assign_as_result
    respond_to do |format|
      format.html { redirect_to users_course_assignment_path(@course, @assignment), notice: 'assignment_user was successfully assigned as a final result.' }
    end
  end

  def result
    private_results = params[:private]
    public_results = params[:public]

    private_results[:experiments].each do |exp|
      @assignment_user.assignment_user_private_results.new(name: exp[:name],
                                                           diff: exp[:diff],
                                                           status: exp[:status])
    end

    public_results[:experiments].each do |exp|
       @assignment_user.assignment_user_public_results.new(name: exp[:name],
                                                           diff: exp[:diff],
                                                           status: exp[:status])
    end

    @assignment_user.update(compilation_error: :passed, status: :processed, public_score: public_results[:n_passed_exp],public_n_exps: public_results[:n_exp], private_score: private_results[:n_passed_exp], private_n_exps: private_results[:n_exp])
    render json: {}, status: :ok
  end

  def result_zip
    @assignment_user.update(private_zip_result: params[:private_zip], public_zip_result: params[:public_zip])
    render json: {}, status: :ok
  end

  def compilation_error
      @assignment_user.update(compilation_file: params[:compilation_file], compilation_error: :failed, status: :error)
      render json: {}, status: :ok
  end

  def show
    add_breadcrumb "submit", users_course_assignment_assignment_user_path(@course, @assignment)
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
      @assignment_user = current_user.assignment_users.find(params[:id])
    end

    def assignment_user_params
      params.require(:assignment_user).permit(assignment_user_files_attributes: [
                                                :file,
                                                :assignment_file_id
                                              ])
    end




    def set_course_for_result
      @course = Course.find(params[:course_id])
    end

    def set_assignment_user_for_result
      @assignment_user = AssignmentUser.find(params[:id])
    end

    # def results_params
    #   params.permit(:public, :private, :compilation)
    # end
end
