class TasksController < ApplicationController
  before_filter :ensure_logged_in
  def index
    @tasks = @auth.tasks.order(:title)
  end
  def create
    task = Task.create(params[:task])
    @auth.tasks << task
    render :json => [task]
  end
  def show
  end
  def edit
  end
  def update
    tasks = Task.find(params[:id])
    task.update_attributes(params[:task])
    render :json => [task]
  end
  def destroy
    task = Task.find(params[:id])
    task.delete
    render :json => nil
  end
end