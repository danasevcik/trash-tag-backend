class VolunteersController < ApplicationController

  def index
    @volunteers = Volunteer.all
    render json: @volunteers
  end

  def show
    @volunteer = Volunteer.find(params[:id])
    render json: @volunteer
  end

  def create
    @volunteer = Volunteer.create(volunteer_params)
    render json: @volunteer
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:name, :picture, :hometown, :current_city, :age, :bio)
  end

end
