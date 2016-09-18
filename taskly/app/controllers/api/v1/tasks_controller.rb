class Api::V1::TasksController < ApplicationController

  def index
    user = User.find_by(id:params[:user_id])
    unless user
      render json: {error: "User not found, sorry"}, status: 404
      return
    end
    tasks = user.tasks
    render json: tasks
  end

  def create
    user = User.find_by(id:params[:user_id])
    unless user
      render json: {error: "User not found, sorry"}, status: 404
      return
    end
    task = user.tasks.create(task_params)
    #task = Task.create(task_params)
    render json: task
  end

  def show
    user = User.find_by(id:params[:user_id])
    unless user
      render json: {error: "User not found, sorry"}, status: 404
      return
    end
    task = user.tasks.find_by(id:params[:id])
    #task = Task.where(id: params[:id], user_id: params[:user_id])
    unless task
      render json: {error: "task not found, sorry"}, status: 404
      return
    end
    render json: task
  end

  def complete
    user = User.find_by(id: params[:user_id])
    unless user
      render json: {error: "User not found, sorry"}, status: 404
      return
    end
    task = user.tasks.find_by(id: params[:id])
    #task = Task.where(id: params[:id], user_id: params[:user_id])
    unless task
      render json: {error: "task not found, sorry"}, status: 404
      return
    end
    task.complete
    render json: task
  end



  def destroy
    user = User.find_by(id: params[:user_id])
    unless user
      render json: {error: "User not found, sorry"}, status: 404
      return
    end
    task = user.tasks.find_by(id: params[:id])
    #task = Task.where(id: params[:id], user_id: params[:user_id])
    unless task
      render json: {error: "task not found, sorry"}, status: 404
      return
    end
    task.destroy
    render json: task
  end



  private

    def task_params
      params.require(:task).permit(:name, :due_date)
    end
end
