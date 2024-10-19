class TasksController < ApplicationController
  def index
    @tasks = Task.where.not(status: nil)
    @task = Task.new 
  end

  def create
    @task = Task.new(task_params)
    @task.status ||= "Incomplete" 

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :index
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(status: "Complete") 
    redirect_to tasks_path, notice: 'Task was marked as complete.'
  end

  private

  def task_params
    params.require(:task).permit(:status) 
  end
end


