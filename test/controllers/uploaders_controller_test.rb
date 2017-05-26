require 'test_helper'

class UploadersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get uploaders_create_url
    assert_response :success
  end

end
