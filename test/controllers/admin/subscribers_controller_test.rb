require "test_helper"

class Admin::SubscribersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:one)
  end

  test "should get index" do
    get admin_subscribers_url
    assert_response :success
  end
end
