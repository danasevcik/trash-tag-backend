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
    # byebug
    @volunteer = Volunteer.find_or_create_by({user_id: curr_user.id, project_id: params[:project_id], admin: false, username: curr_user.username})

    render json: @volunteer
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:user_id, :project_id, :admin, :username)
  end

end
