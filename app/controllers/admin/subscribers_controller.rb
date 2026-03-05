class Admin::SubscribersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @subscribers = Subscriber.order(created_at: :desc)
  end
end
