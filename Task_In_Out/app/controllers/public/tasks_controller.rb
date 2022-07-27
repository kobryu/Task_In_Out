class Public::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]

  def index
    @task = Task.new
    #@tasks = Task.where(done_at:nil)
    @q = Task.where(done_at:nil).ransack(params[:q])
    @tasks = @q.result
  end

  def show
    @task = Task.find(params[:id])
    @post_comment = PostComment.new
  end


  def create
    @tasks = current_user.tasks
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    redirect_to tasks_path
  end

  def edit
    Task.find(params[:id])
  end

  def done
    @today = Date.today
    task = Task.find(params[:id])
    task.update(done_at: @today )
    redirect_to tasks_path
  end

  def update
    Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "You have updated task successfully."
    else
      render "edit"

    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Task.ransack(params[:q])
  end

  def task_params
     params.require(:task).permit(:user_id, :title, :body, :due_date, :genre_id, :person_name)
  end

  def ensure_correct_user
    @task = Task.find(params[:id])
    unless @task.user == current_user
      redirect_to tasks_path
    end
  end
end
