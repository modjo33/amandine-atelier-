class Admin::TestimonialsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"
  before_action :set_testimonial, only: %i[edit update destroy]

  def index
    @testimonials = Testimonial.ordered
  end

  def new
    @testimonial = Testimonial.new(position: (Testimonial.maximum(:position) || 0) + 1)
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      redirect_to admin_testimonials_path, notice: "Témoignage ajouté."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @testimonial.update(testimonial_params)
      redirect_to admin_testimonials_path, notice: "Témoignage mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @testimonial.destroy
    redirect_to admin_testimonials_path, notice: "Témoignage supprimé."
  end

  private

  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end

  def testimonial_params
    params.require(:testimonial).permit(:quote, :name, :role, :position, :active)
  end
end
