class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Merci pour votre inscription !" }
        format.json { render json: { message: "Merci pour votre inscription !" }, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: @subscriber.errors.full_messages.join(", ") }
        format.json { render json: { errors: @subscriber.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :first_name, :source)
  end
end
