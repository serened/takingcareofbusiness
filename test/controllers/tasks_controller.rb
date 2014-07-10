require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get complete status" do
    get :complete
    assert_response :success
  end
  
end
