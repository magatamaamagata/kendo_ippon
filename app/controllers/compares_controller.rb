class ComparesController < ApplicationController
  before_action :set_skill, only: [:new, :edit, :move_to_index]
  before_action :set_compare, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:new, :create, :edit, :update]
  # after_action :render_new,only: [:new]

  def new
    # @skill = Skill.find(params[:skill_id])
    @compare = Compare.new
    # path = Rails.application.routes.recognize_path(request.referer)
    # bindning.pry
    # if path == root_path
    #   redirect_to skill_path(params[:skill_id])
    # end
    # unless request.full_path == root_path

    # end
  end

  def create
    @compare = Compare.new(compare_params)

    if @compare.valid?
      @compare.save
      redirect_to skill_path(params[:skill_id])
    else
      render :new
    end
  end

  def edit
    # @compare = Compare.find(params[:id])
    # unless Compare.where(id: params[:id]).present?
    #   render :new
    # end
  end

  def update
    # @compare = Compare.find(params[:id])
    if @compare.update(compare_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:skill_id])
  end

  def set_compare
    @compare = Compare.find_by(skill_id: params[:skill_id])
  end

  def move_to_index
    @skill = Skill.find(params[:skill_id])
    redirect_to root_path unless user_signed_in? && (current_user.id == @skill.user.id)
  end

  def render_new
    @skill = Skill.find(params[:skill_id])
    redirect_to new_skill_compare_path(@skill.id) unless @compare.present?
  end

  def compare_params
    params.require(:compare).permit(:amagata, :problem, :make_better, :notice, :public_id).merge(skill_id: params[:skill_id])
  end
end
