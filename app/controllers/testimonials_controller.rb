class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:show, :update, :destroy]

  # shows all testimonials 
  def index
    @testimonials = Testimonial.all

    render json: @testimonials
  end

  # selects testimonials at random to display, changed on refresh
  def sample
    @testimonials = Testimonial.all

    selected = []

    while(selected.length < params[:number].to_i) do
     selected << @testimonials.sample
     selected.uniq!
    end

    @testimonials.each do |testimonial|
      if testimonial.image_url.nil? and (not testimonial.image.url.nil?)
        testimonial.image_url = testimonial.image.url
      end
    end
    
    render json: selected
  end

  # shows all testimonials 
  def show
    render json: @testimonial
  end

  # create new testimonial
  def create
    @testimonial = Testimonial.new(testimonial_params)

    if @testimonial.save
      render json: @testimonial, status: :created
    else
      render json: @testimonial.errors, status: :unprocessable_entity
    end
  end

  # update testimonials
  def update
    if @testimonial.update(testimonial_params)
      render json: @testimonial
    else
      render json: @testimonial.errors, status: :unprocessable_entity
    end
  end

  # delete testimonials
  def destroy
    @testimonial.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
      
    end

    # Only allow a list of trusted parameters through.
    def testimonial_params
      params.require(:testimonial).permit(:name, :body, :image)
    end
end
