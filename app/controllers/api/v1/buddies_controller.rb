class Api::V1::BuddiesController < ApplicationController
  before_action :set_buddy, only: []

  def index
    @buddies = Buddy.all.order(name: :asc)
    render json: @buddies
  end

  private 
    def set_buddy
      @buddy = Buddy.find(params[:id])
    end

    def buddy_params
      params.permit(:name, :species, :color, :age, :adoptable)
    end
end
