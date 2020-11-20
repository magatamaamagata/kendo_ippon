class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @skill = Skill.find(params[:skill_id])
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @comment = Comment.create(comment_params)
    # render json: { comment: @comment }
    redirect_to skill_path(params[:skill_id])
  end

  private
  def move_to_index
    # @comment = Comment.find(params[:skill_id])
    @skill = Skill.find(params[:skill_id])
    redirect_to root_path unless user_signed_in? && (current_user.id == @skill.user.id)
  end

  def comment_params
    @skill = Skill.find(params[:skill_id])
    params.require(:comment).permit(:text).merge(user_id: current_user.id, skill_id: @skill.id)
  end
end
