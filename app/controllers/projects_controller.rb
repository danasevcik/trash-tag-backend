class ProjectsController < ApplicationController
skip_before_action :authorized, only: [:index]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end

  def create
    @project = Project.create(project_params)
    @volunteer = Volunteer.create(user_id: curr_user.id, project_id: @project.id, admin: true)
    render json: [@project, @volunteer]
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private
  def project_params
    params.require(:project).permit(:name, :location, :date, :story, :start_image, :end_image, :completed, :time)
  end

end
