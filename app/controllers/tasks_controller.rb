class TasksController < ApplicationController
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks.where.not(status: nil) 
    else
      @tasks = Task.where.not(status: nil)
    end
    @task = Task.new 
  end

  def create
    @task = Task.new(task_params)
    @task.status ||= "Incomplete" 

    if @task.save
      redirect_to category_tasks_path(@task.category_id), notice: 'Task was successfully created.' 
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
    params.require(:task).permit(:status, :category_id) 
  end
end
