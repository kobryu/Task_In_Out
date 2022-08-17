class Admin::TasksController < ApplicationController
before_action :authenticate_admin!
before_action :set_q, only: [:index, :search]

  def index
    @task = Task.new
    #@tasks = Task.where(done_at:nil)
    @q = Task.all.ransack(params[:q])
    @tasks = @q.result.page(params[:page]).per(40)
  end

  def show
     @task = Task.find(params[:id])

  end

  # def done
  #   @today = Date.today
  #   task = Task.find(params[:id])
  #   task.update(done_at: @today )
  #   redirect_to tasks_path
  # end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to admin_tasks_path
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Task.ransack(params[:q])
  end

end
