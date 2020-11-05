class CommentsController < ApplicationController
  before_action :move_to_index
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @skill = Skill.find(params[:skill_id])
  end

  def create

    @comment = Comment.create(comment_params)
    binding.pry
    render json: { comment: @comment }
  end

  private
  def move_to_index
    @comment = Comment.find(params[:id])
    redirect_to root_path unless user_signed_in? && (current_user.id == @skill.user.id)
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, skill_id: params[:skill_id])
  end
end
