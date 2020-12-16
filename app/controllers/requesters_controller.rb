class RequestersController < ApplicationController
  before_action :set_requester, only: [:show, :update, :destroy]
  before_action :authorized
  # GET /requesters
  def index
    @requesters = Requester.where user: @user.id

    render json: @requesters
  end

  # GET /requesters/1
  def show
    render json: @requester
  end

  # POST /requesters
  def create
    @requester = Requester.new(requester_params)
    @requester.user = @user

    if @requester.save
      render json: @requester, status: :created, location: @requester
    else
      render json: @requester.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requesters/1
  def update
    if @requester.update(requester_params)
      render json: @requester
    else
      render json: @requester.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requesters/1
  def destroy
    @requester.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requester
      @requester = Requester.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def requester_params
      params.require(:requester).permit(:name, :opportunity_type, :opportunity_description, :contact_info, :user_id)
    end
end
