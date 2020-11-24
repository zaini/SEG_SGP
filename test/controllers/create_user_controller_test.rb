require 'test_helper'

class CreateUserControllerTest < ActionDispatch::IntegrationTest
  test "should get create_user" do
    get create_user_create_user_url
    assert_response :success
  end

end
