class Professors::ProfessorsController < ApplicationController
  before_action :authenticate_professor!
  before_action :set_course
  before_action :set_professor, only: [:approve, :reject, :destroy]
  before_action :set_professor_subscription, only: [:approve, :reject, :destroy]
  before_action :set_breadcrumbs


  def index
    @professors = @course.professors
    @professor_subscriptions_aw = @course.professor_subscriptions.awaiting
    @professor_subscriptions_re = @course.professor_subscriptions.rejected
  end

  def approve
    respond_to do |format|
      if @professor_subscription
        if @professor_subscription.awaiting? or @professor_subscription.rejected?
          if @professor.courses << @course and @professor_subscription.approved!
            format.html { redirect_to professors_course_professors_path(@course), notice: 'the subscription was approved' }
          else
            format.html { redirect_to professors_course_professors_path(@course), alert: 'An error occurred, the subscription request could not be approved' }
          end
        else
          format.html { redirect_to professors_course_professors_path(@course), alert: 'the subscription was previously approved' }
        end
      else
        format.html { redirect_to professors_course_professors_path(@course), alert: 'there is no subscription that associates teacher with course' }
      end
    end
  end

  def reject
    respond_to do |format|
      if @professor_subscription
        if @professor_subscription.awaiting?
          if @professor_subscription.rejected!
            format.html { redirect_to professors_course_professors_path(@course), notice: 'the subscription was rejected' }
          else
            format.html { redirect_to professors_course_professors_path(@course), alert: 'An error occurred, the subscription request could not be rejected' }
          end
        else
          format.html { redirect_to professors_course_professors_path(@course), alert: 'the subscription was previously rejected or approved' }
        end
      else
        format.html { redirect_to professors_course_professors_path(@course), alert: 'there is no subscription that associates teacher with course' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @professor_subscription
        if @professor.courses.delete(@course) and @professor_subscription.rejected!
          format.html { redirect_to professors_course_professors_path(@course), notice: 'the teacher was unsubscribed from the course' }
        else
          format.html { redirect_to professors_course_professors_path(@course), alert: 'An error occurred, the subscription request' }
        end
      else
        format.html { redirect_to professors_course_professors_path(@course), alert: 'there is no subscription that associates teacher with course' }
      end
    end
  end

  private
    def set_breadcrumbs
      add_breadcrumb "courses", :professors_courses_path
      add_breadcrumb @course.name, professors_course_path(@course)
      add_breadcrumb "teachers", professors_course_professors_path(@course)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = current_professor.courses.find(params[:course_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    def set_professor_subscription
      @professor_subscription = ProfessorSubscription.find_by(professor: @professor, course: @course)
    end
end
