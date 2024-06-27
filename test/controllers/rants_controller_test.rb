require "test_helper"

class RantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rants_new_url
    assert_response :success
  end

  test "should get create" do
    get rants_create_url
    assert_response :success
  end
end
