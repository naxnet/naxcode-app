require 'test_helper'

class Users::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_courses_index_url
    assert_response :success
  end

end
