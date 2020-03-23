class Users::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course_by_short_id, only: [:subscribe]


  add_breadcrumb "courses", :users_courses_path

  def index
    @courses = current_user.courses
  end

  def show

  end


  def subscribe
    respond_to do |format|
      if @course
        if UserSubscription.find_by(user: current_user, course: @course) or current_user.courses.find_by(id: @course)
          format.html { redirect_to users_courses_url, alert: 'You have already created a subscription request for the course: ' + @course.name }
        else
          user_subscription = UserSubscription.new(user: current_user, course: @course)
          if user_subscription.save
            format.html { redirect_to users_courses_url, notice: @course.name + ' course registration awaiting approval.' }
          else
            format.html { redirect_to users_courses_url, alert: 'An error occurred, the subscription request could not be created' }
          end
        end
      else
        format.html { redirect_to users_courses_url, alert: 'course not found.' }
      end
    end
  end

  def destroy

  end

  private
    def set_course_by_short_id
      @course = Course.find_by(short_id: params[:short_id])
    end
end
