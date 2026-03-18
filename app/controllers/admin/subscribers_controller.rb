class Admin::SubscribersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @subscribers = Subscriber.order(created_at: :desc)
  end
end
