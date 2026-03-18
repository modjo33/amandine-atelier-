class PagesController < ApplicationController
  def home
    @posts = Post.where(active: true).order(position: :asc).limit(12)
    @testimonials = Testimonial.active.ordered
    @hide_popup = params[:ref] == "instagram"
    @c = SiteContent.all.index_by(&:key)
    track_page_view
  end

  def instagram_landing
    @hide_popup = true
    track_page_view
  end

  private

  def track_page_view
    PageView.create(
      path: request.path,
      ip_address: request.remote_ip,
      user_agent: request.user_agent&.truncate(500)
    )
  end
end
