class Public::FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    task = Task.find(params[:task_id])
    @favorite = current_user.favorites.new(task_id: task.id)
    @favorite.save
    redirect_to request.referer
  end

  def destroy
    task = Task.find(params[:task_id])
    @favorite = current_user.favorites.find_by(task_id: task.id)
    @favorite.destroy
    redirect_to request.referer
  end

end
