class CommentsController < ApplicationController

  def create
    @comments = Comment.all
    @comment = Comment.create(comment_params)
    binding.pry
    render json:{ comment: @comment }
  end

  private
  def comment_params
    params.require(:comment).permit(:text, compare: [:comment]).merge(user_id: current_user.id)
  end
end
