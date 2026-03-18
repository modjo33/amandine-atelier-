class UnsubscribesController < ApplicationController
  def show
    @contact = Contact.find_by!(unsubscribe_token: params[:token])
    @contact.update!(newsletter_opt_in: false)
  end
end
