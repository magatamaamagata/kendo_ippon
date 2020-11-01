class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :destroy ,:update]
  # before_action :authenticate_user!, only: [:new,:edit,:update]
  # before_action :move_to_index, only: [:edit, :update, :delete]

  def index
    @skills = Skill.includes(:user).order('created_at DESC')
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    unless @skill.valid?
      render :new and return
    end
   session["skill.movie_data"] = {skill: @skill.attributes}
  #  session["skill.movie_data"][:skill]["video"]  = params[:skill][:video]
   @compare = @skill.build_compare
   render :new_compare
  end

  def show
    @skill = Skill.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to root_path
  end

  def create_compare
    @skill = Skill.new(session["skill.movie_data"]["skill"])
    @compare = Compare.new(compare_params)
    # unless @compare.valid?
    #   render :new_compare and return
    # end
    # @skill.build_compare(@compare.attributes)
    @skill.save
    @compare.save
    binding.pry
    session["skill.movie_data"]["skill"].clear
    redirect_to root_path
  end
 
  private
 
  def set_skill
    @skill = Skill.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && (current_user.id == @skill.user_id)
      redirect_to root_path 
    end
  end

  def skill_params
    params.require(:skill).permit(:technique, :video).merge(user_id: current_user.id)
  end

  def compare_params
    # unless @compare.nil?
    params.permit(:sprits, :posture,:bamboo,:position,:sword,:zanshin,:sprits2,:posture2,:bamboo2,:position2,:sword2,:zanshin2,:notice).merge(skill_id: params[:skill_id])
    # end
  end

end
