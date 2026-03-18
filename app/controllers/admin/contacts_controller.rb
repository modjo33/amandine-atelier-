class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @contacts = Contact.order(created_at: :desc)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to admin_contacts_path, notice: "Message supprimé."
  end
end
