class TasksController < ApplicationController

  def index
    get_project
    @tasks = Task.where(params[:project_id])
  end

  def edit
    get_user
    get_task
  end

  def task_completed
    @task_complete = false

    @task = Task.find(param[:id])
    @task.complete = Time.now
      
    if @task.save
      @task_complete = true
      flash[:success] = "You rule!"
      redirect_to tasks_path
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to tasks_path
    end   
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
  # def new
  #   get_user
  #   @project = Project.new
  # end

  # def create
  #   @project = Project.new(project_params)

  #   if @project.save
  #     flash[:success] = "Your project lives!"
  #     redirect_to user_projects_path
  #   else
  #     flash[:alert] = "Doh! Try again!"
  #     redirect_to new_user_project_path
  #   end
  # end

  # def edit
  #   get_user
  #   get_project
  # end

  # def update
  #   get_project
  #   get_user
  #   @project.update!(project_params)

  #   if @project.save
  #     flash[:success] = "Your project has been updated!"
  #     redirect_to user_projects_path(@user.id)
  #   else
  #     flash[:alert] = "Doh! Try again!"
  #     redirect_to new_user_project_path
  #   end
  # end

  # def destroy
  #   if @project.delete
  #     flash[:success] = "Your project has been buh-leted!"
  #     redirect_to user_projects_path
  #   else
  #     flash[:alert] = "Doh! Try again!"
  #     redirect_to new_user_project_path
  #   end
  # end

  private

  def task_state
    @task_complete = false
  end

  def task_params
    params.require(:task).permit(:title, :note)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_task
    @task = Task.find(params[:id])
  end
end
