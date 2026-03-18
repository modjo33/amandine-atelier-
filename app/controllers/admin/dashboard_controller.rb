class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @posts_count = Post.count
    @active_posts_count = Post.where(active: true).count
    @subscribers_count = Subscriber.count
    @sections_count = SiteContent.distinct.pluck(:section).count
    @contents_count = SiteContent.count
  end
end
