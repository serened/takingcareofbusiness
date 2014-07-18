class ProjectsController < ApplicationController

  def index
    get_user

    if @user.nil?
      flash[:alert] = "You must be logged in!"
      redirect_to log_in_path
    else
      @projects = Project.where(user_id: @user.id)
    end

  end

  def new
    get_user
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = "Your project lives!"
      redirect_to user_projects_path
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to new_user_project_path
    end
  end

  def edit
    get_user
    get_project
  end

  def update
    get_project
    get_user
    @project.update!(project_params)

    if @project.save
      flash[:success] = "Your project has been updated!"
      redirect_to user_projects_path(@user.id)
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to new_user_project_path
    end
  end

  def destroy
    if @project.delete
      flash[:success] = "Your project has been buh-leted!"
      redirect_to user_projects_path
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to new_user_project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :note, :user_id)
  end

  def get_user
    @user = current_user
  end

  def get_project
    @project = Project.find(params[:id])
  end
end
