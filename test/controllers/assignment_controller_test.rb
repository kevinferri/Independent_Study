require 'test_helper'

class AssignmentControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get description:string" do
    get :description:string
    assert_response :success
  end

  test "should get class_name:string" do
    get :class_name:string
    assert_response :success
  end

  test "should get class_code:string" do
    get :class_code:string
    assert_response :success
  end

  test "should get user_id:integer" do
    get :user_id:integer
    assert_response :success
  end

end
