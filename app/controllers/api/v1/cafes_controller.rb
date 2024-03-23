class Api::V1::CafesController < ApplicationController

  # '/api/v1/cafes'
  # '/api/v1/cafes?title=name
  def index
    if params[:title].present?
      # filter
      @cafes = Cafe.where('title ILIKE ?', "%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end
    # don't want to render HTML (i.e. render 'index.html.erb')
    # order based on newest first
    render json: @cafes.order(created_at: :desc)
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      render json: @cafe, status: :created
    else
      render json: { error: @cafe.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end
end
