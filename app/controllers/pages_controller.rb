class PagesController < ApplicationController
  def home
    @posts = Post.where(active: true).order(position: :asc).limit(12)
    @hide_popup = params[:ref] == "instagram"
  end

  def instagram_landing
    @hide_popup = true
  end
end
