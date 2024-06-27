require "test_helper"

class CasualPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get casual_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get casual_posts_create_url
    assert_response :success
  end
end
