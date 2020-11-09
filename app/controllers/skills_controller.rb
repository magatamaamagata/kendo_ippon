class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :delete]

  def index
    @skills = Skill.includes(:user).order('created_at DESC')
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create(skill_params)
    if @skill.valid?
      redirect_to new_skill_compare_path(@skill.id)
    else
      render :new
    end
  end

  def show
    @skill = Skill.find(params[:id])
    @comment = Comment.new
    @comments = Comment.includes(:user).includes(:skill).order('created_at DESC')
  end

  def edit
    # @skill = Skill.find(params[:id])
  end

  def update
    # @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to edit_skill_compare_path(@skill.id, params[:id])
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to root_path
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && (current_user.id == @skill.user_id)
  end

  def skill_params
    params.require(:skill).permit(:youtube_id, :video).merge(user_id: current_user.id)
  end
end
