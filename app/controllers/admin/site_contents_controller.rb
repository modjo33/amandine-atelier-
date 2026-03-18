class Admin::SiteContentsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @sections = SiteContent.order(:section, :position).group_by(&:section)
  end

  def edit
    @section = params[:section]
    @contents = SiteContent.by_section(@section)
    redirect_to admin_site_contents_path, alert: "Section introuvable." if @contents.empty?
  end

  def update
    @section = params[:section]
    @contents = SiteContent.by_section(@section)

    ActiveRecord::Base.transaction do
      params[:contents].each do |key, attrs|
        content = SiteContent.find_by!(key: key)
        content.value = attrs[:value] if attrs[:value].present? || content.text?
        content.image.attach(attrs[:image]) if attrs[:image].present?
        content.save!
      end
    end

    redirect_to edit_admin_site_contents_path(section: @section), notice: "Section « #{@section.humanize} » mise à jour !"
  rescue ActiveRecord::RecordInvalid => e
    redirect_to edit_admin_site_contents_path(section: @section), alert: "Erreur : #{e.message}"
  end

  def destroy_image
    content = SiteContent.find_by!(key: params[:key])
    content.image.purge if content.image.attached?
    redirect_to edit_admin_site_contents_path(section: content.section), notice: "Image supprimée."
  end
end
