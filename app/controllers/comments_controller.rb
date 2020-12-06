class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @skill = Skill.find(params[:skill_id])
  end

  def create
    @skill = Skill.find(params[:skill_id])
    if Comment.find_by(skill_id: @skill.id) 
      @comment = Comment.create(comment_params)
      render json: {comment: @comment, status: :created, location: @comment }
    else
      @comment = Comment.create(comment_params)
      redirect_to skill_path(@skill.id)
    end 
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @comment = Comment.find_by(skill_id: params[:skill_id])
    @comment.destroy
    redirect_to skill_path(@skill)
  end

  private

  def move_to_index
    @skill = Skill.find(params[:skill_id])
    redirect_to root_path unless user_signed_in? && (current_user.id == @skill.user.id)
  end

  def comment_params
    @skill = Skill.find(params[:skill_id])
    params.require(:comment).permit(:text).merge(user_id: current_user.id, skill_id: @skill.id)
  end
end
