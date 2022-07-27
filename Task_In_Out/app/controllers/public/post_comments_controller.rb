class Public::PostCommentsController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.task_id = @task.id
    @comment.save
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = PostComment.find_by(id: params[:id], task_id: params[:task_id])
    @comment.destroy
    redirect_to task_path(@task)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
