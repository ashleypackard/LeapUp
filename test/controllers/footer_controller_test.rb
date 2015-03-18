require 'test_helper'

class FooterControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

end
