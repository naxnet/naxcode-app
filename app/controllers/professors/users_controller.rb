class Professors::UsersController < ApplicationController
  before_action :authenticate_professor!
  before_action :set_course
  before_action :set_user, only: [:approve, :reject, :destroy]
  before_action :set_user_subscription, only: [:approve, :reject, :destroy]
  before_action :set_breadcrumbs


  def index
    @users = @course.users
    @user_subscriptions_aw = @course.user_subscriptions.awaiting
    @user_subscriptions_re = @course.user_subscriptions.rejected
  end

  def approve
    respond_to do |format|
      if @user_subscription
        if @user_subscription.awaiting? or @user_subscription.rejected?
          if @user.courses << @course and @user_subscription.approved!
            format.html { redirect_to professors_course_users_path(@course), notice: 'the subscription was approved' }
          else
            format.html { redirect_to professors_course_users_path(@course), alert: 'An error occurred, the subscription request could not be approved' }
          end
        else
          format.html { redirect_to professors_course_users_path(@course), alert: 'the subscription was previously approved' }
        end
      else
        format.html { redirect_to professors_course_users_path(@course), alert: 'there is no subscription that associates teacher with course' }
      end
    end
  end

  def reject
    respond_to do |format|
      if @user_subscription
        if @user_subscription.awaiting?
          if @user_subscription.rejected!
            format.html { redirect_to professors_course_users_path(@course), notice: 'the subscription was rejected' }
          else
            format.html { redirect_to professors_course_users_path(@course), alert: 'An error occurred, the subscription request could not be rejected' }
          end
        else
          format.html { redirect_to professors_course_users_path(@course), alert: 'the subscription was previously rejected or approved' }
        end
      else
        format.html { redirect_to professors_course_users_path(@course), alert: 'there is no subscription that associates teacher with course' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user_subscription
        if @user.courses.delete(@course) and @user_subscription.rejected!
          format.html { redirect_to professors_course_users_path(@course), notice: 'the teacher was unsubscribed from the course' }
        else
          format.html { redirect_to professors_course_users_path(@course), alert: 'An error occurred, the subscription request' }
        end
      else
        format.html { redirect_to professors_course_users_path(@course), alert: 'there is no subscription that associates teacher with course' }
      end
    end
  end


  private
    def set_breadcrumbs
      add_breadcrumb "courses", :professors_courses_path
      add_breadcrumb @course.name, professors_course_path(@course)
      add_breadcrumb "Students", professors_course_users_path(@course)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = current_professor.courses.find(params[:course_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_user_subscription
      @user_subscription = UserSubscription.find_by(user: @user, course: @course)
    end
end
