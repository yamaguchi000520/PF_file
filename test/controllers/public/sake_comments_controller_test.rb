require "test_helper"

class Public::SakeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_sake_comments_edit_url
    assert_response :success
  end
end
