class Api::V1::CafesController < ApplicationController

  # '/api/v1/cafes'
  def index
    @cafes = Cafe.all
    # don't want to render HTML (i.e. render 'index.html.erb')
    render json: @cafes
  end
end
