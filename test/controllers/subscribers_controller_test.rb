require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should create subscriber" do
    assert_difference("Subscriber.count", 1) do
      post subscribers_url, params: { subscriber: { email: "new@test.com", first_name: "Test", source: "web" } }
    end
  end
end
