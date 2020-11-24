class ComparesController < ApplicationController
  before_action :set_skill, only: [:new, :edit, :move_to_index]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:new, :create, :edit, :update]


  def new
    @compare = Compare.new
    render layout: "no_link"
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
    
    if !(@skill.compare.nil?) 
      @compare = Compare.find_by(skill_id: params[:skill_id])
    else
      @compare = Compare.new
    end
    render layout: "no_link"

  end

  def update
    @compare = Compare.find_by(skill_id: params[:skill_id])
    if @compare.update(compare_params)
      redirect_to skill_path(params[:skill_id])
    else
      render :edit
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:skill_id])
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
    params.require(:compare).permit(:continuation, :problem, :make_better, :notice, :public_id).merge(skill_id: params[:skill_id])
  end
end
