require 'test_helper'

class Professors::ProfessorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professors_professors_index_url
    assert_response :success
  end

  test "should get approve" do
    get professors_professors_approve_url
    assert_response :success
  end

  test "should get reject" do
    get professors_professors_reject_url
    assert_response :success
  end

  test "should get destroy" do
    get professors_professors_destroy_url
    assert_response :success
  end

end
