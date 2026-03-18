class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @posts_count = Post.count
    @active_posts_count = Post.where(active: true).count
    @subscribers_count = Subscriber.count
    @sections_count = SiteContent.distinct.pluck(:section).count
    @contents_count = SiteContent.count
    @testimonials_count = Testimonial.count
    @active_testimonials_count = Testimonial.active.count

    # Analytics
    @views_today = PageView.today.count
    @views_week = PageView.this_week.count
    @views_month = PageView.this_month.count
    @unique_visitors_today = PageView.today.distinct.count(:ip_address)

    # Conversion rate (subscribers / unique visitors this month)
    unique_month = PageView.this_month.distinct.count(:ip_address)
    new_subs_month = Subscriber.where(created_at: Time.current.all_month).count
    @conversion_rate = unique_month > 0 ? ((new_subs_month.to_f / unique_month) * 100).round(1) : 0

    # Last 7 days chart data
    @chart_data = (6.downto(0)).map do |i|
      day = i.days.ago.to_date
      { label: day.strftime("%d/%m"), views: PageView.where(created_at: day.all_day).count }
    end
  end
end
