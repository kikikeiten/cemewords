require "test_helper"

class CemewordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cemewords_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cemewords_destroy_url
    assert_response :success
  end
end
