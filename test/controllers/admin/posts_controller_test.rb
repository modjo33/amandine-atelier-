require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:one)
    @post = posts(:one)
  end

  test "should get index" do
    get admin_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_url
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_url(@post)
    assert_response :success
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete admin_post_url(@post)
    end
    assert_redirected_to admin_posts_url
  end
end
