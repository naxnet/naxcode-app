require 'test_helper'

class Professors::AssignmentUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get professors_assignment_users_show_url
    assert_response :success
  end

end
