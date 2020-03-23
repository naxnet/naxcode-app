require 'test_helper'

class Professors::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professors_users_index_url
    assert_response :success
  end

end
