require 'test_helper'

class Users::AssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_assignments_index_url
    assert_response :success
  end

  test "should get show" do
    get users_assignments_show_url
    assert_response :success
  end

end
