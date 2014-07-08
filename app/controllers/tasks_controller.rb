class TasksController < ApplicationController

  def index
    get_project
    @tasks = Task.where(params[:project_id])
  end

  def edit
    get_user
    get_task
  end

  def toggle_completed
    get_task

    # task_state = params[:completed] || session[:completed]

    @task.toggle!(:completed)

    respond_to do |format|
      flash[:success] = "Task updated"
      format.html { redirect_to project_tasks_path }
    end

    # if completed == 'true'
    #   @task.update_attributes(completed: true)
    # else
    #   @task.update_attributes(completed: false)
    # end

    # if @task.save
    #   flash[:success] = "Psst! This task still needs to be completed!"
    # else
    #   flash[:alert] = "Doh! Try again!"
    # end    
    # redirect_to project_tasks_path
  end

  # def completed_on
  #   get_task
  #   @task.update_attributes(completed: true)

  #   if @task.save
  #     flash[:success] = "Way to go! You rule!"
  #   else
  #     flash[:alert] = "Doh! Try again!"
  #   end

  #   redirect_to project_tasks_path
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

  def new
    get_project
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = "A new task lives!"
      redirect_to project_tasks_path
    else
      flash[:alert] = "Doh! Try again!"
      redirect_to new_project_task_path
    end
  end

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

  def task_params
    params.require(:task).permit(:title, :note, :completed)
  end

  # def get_user
  #   @user = current_user
  # end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_task
    @task = Task.find(params[:id])
  end
end
