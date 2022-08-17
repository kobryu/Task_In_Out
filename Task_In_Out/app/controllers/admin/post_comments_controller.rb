class Admin::PostCommentsController < ApplicationController


def destroy
  @task = Task.find(params[:task_id])
  @comment = PostComment.find_by(id: params[:id], task_id: params[:task_id])
  @comment.destroy
  redirect_to admin_task_path(@task)
end





end
