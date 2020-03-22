class ApplicationController < ActionController::Base
  layout :layout_by_resource



  private

    def after_sign_in_path_for(resource)

      if resource.class.name == "User"
        stored_location_for(resource) || users_courses_path
      elsif resource.class.name == "Professor"
        stored_location_for(resource) || professors_courses_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :user
        new_user_session_path
      elsif resource_or_scope == :professor
        new_professor_session_path
      else
        root_path
      end
    end


    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
end
