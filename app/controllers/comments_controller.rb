class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @skill = Skill.find(params[:skill_id])
  end
  def create
    @comment = Comment.create(comment_params)
    render json:{ comment: @comment }
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,skill_id: params[:skill_id])
  end
end
