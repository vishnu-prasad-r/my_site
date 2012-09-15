require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get rules" do
    get :rules
    assert_response :success
  end

end
