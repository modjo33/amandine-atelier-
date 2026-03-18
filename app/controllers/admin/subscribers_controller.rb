class Admin::SubscribersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @subscribers = Subscriber.order(created_at: :desc)
  end

  def export_csv
    subscribers = Subscriber.order(created_at: :desc)
    csv_data = CSV.generate(headers: true) do |csv|
      csv << [ "Prénom", "Email", "Source", "Date d'inscription" ]
      subscribers.each do |s|
        csv << [ s.first_name, s.email, s.source, s.created_at.strftime("%d/%m/%Y %H:%M") ]
      end
    end
    send_data csv_data, filename: "abonnes-#{Date.current}.csv", type: "text/csv"
  end
end
