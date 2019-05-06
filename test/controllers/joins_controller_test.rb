require 'test_helper'

class JoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get joins_create_url
    assert_response :success
  end

end
