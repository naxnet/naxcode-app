require 'test_helper'

class Users::AssignmentUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_assignment_users_new_url
    assert_response :success
  end

  test "should get show" do
    get users_assignment_users_show_url
    assert_response :success
  end

end
