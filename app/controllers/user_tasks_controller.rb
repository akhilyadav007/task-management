class UserTasksController < ApplicationController
  before_action :set_user_task, only: [:show, :edit, :update, :destroy]

  def index
    @user_tasks = current_user.user_tasks.all
  end

  def show
  end

  def new
    @user_task = UserTask.new
  end

  def edit
  end

  def create
    service = UserTaskService.new(current_user, user_task_params)
    success, @user_task = service.create

    if success
      redirect_to @user_task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    service = UserTaskService.new(current_user, user_task_params)
    success, @user_task = service.update(@user_task)

    if success
      redirect_to @user_task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    service = UserTaskService.new(current_user, user_task_params)
    if service.destroy(@user_task)
      redirect_to user_tasks_url, notice: 'Task was successfully destroyed.'
    else
      redirect_to user_tasks_url, alert: 'Task could not be destroyed.'
    end
  end

  private

  def set_user_task
    @user_task = current_user.user_tasks.find(params[:id])
  end

  def user_task_params
    params.require(:user_task).permit(:title, :description, :state, :deadline)
  end
end
