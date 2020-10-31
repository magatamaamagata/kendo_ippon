class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    render json:{ comment: @comment }
  end

  private
  def comment_params
    params.permit(:authenticity_token, :commit,:skill_id, :compare_id, compare: [:comment]).merge(user_id: current_user.id)
  end
end
