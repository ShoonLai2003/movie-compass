class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), alert: "コメントを入力してください。"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find_by!(id: params[:id],post_id: @post.id)
  
    @comment.destroy
    redirect_to post_path(@post), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end