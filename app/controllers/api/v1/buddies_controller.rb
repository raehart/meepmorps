class Api::V1::BuddiesController < ApplicationController
  # runs set_buddy which looks for existing buddy of param id. 
  before_action :set_buddy, only: [:show, :edit, :update]

  # Show All /Read All
  # Get /buddies
  # Get /buddies.json
  # Returns all Buddies
  def index
    @buddies = Buddy.all.order(name: :asc)
    render json: @buddies
  end

  # Show One /Read One
  # Get /buddies/1 (single buddy)
  # Get /buddies/1.json
  # Returns single Buddy of provided param id
  def show
    if @buddy
      render json: @buddy
    else
      render json: @buddies.errors
    end
  end

  # Create one with default properties
  # Get /buddies/new
  def new
    @buddy = Buddy.new
  end

  # Edit one
  # Get /buddies/1/edit
  def edit
  end

  # Create one with supplied params
  # POST /buddies
  # POST /buddies.json
  def create
    @buddy =  Buddy.new(buddy_params)

    if @buddy.save
      render json: @buddy
    else
      render json: @buddy.errors
    end
  end

  # PATCH/PUT /buddies/1
  # PATCH/PUT /buddies/1.json
  def update
  end

  # DELETE /buddies/1
  # DELETE /buddies/1.json
  def destroy
    @buddy.destroy

    render json: {notice: 'Buddy sucessfully removed'}
  end

  # DELETE ALL buddies
  # def destroy_all
  #   Buddy.delete_all
  # end


  # Makes stuff after keyword private actually private. Yay Ruby on Rails!
  private 
    def set_buddy
      @buddy = Buddy.find(params[:id])
    end

    def buddy_params
      # This line is so amazing! Rails is so powerful. 
      # Filters params to only accept specified ones
      # Very important for security!
      params.permit(:name, :species, :color, :age, :adoptable)
    end
end
