require 'test_helper'

class CreateProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get create_profile" do
    get create_profile_create_profile_url
    assert_response :success
  end

end
