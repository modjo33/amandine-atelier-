require "test_helper"

class Admin::SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_subscribers_index_url
    assert_response :success
  end
end
