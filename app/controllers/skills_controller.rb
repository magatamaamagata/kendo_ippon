class SkillsController < ApplicationController
  class SkillsController < ApplicationController
    before_action :set_skill, only: [:show, :edit, :destroy ,:update]
    before_action :authenticate_user!, only: [:new,:edit,:update]
    before_action :move_to_index, only: [:edit, :update, :delete]
    def index
      @skills = Skill.includes(:user).order('created_at DESC')
    end
  
    def new
      @skill = Skill.new
    end
  
    def create
      @skill = Skill.new(skill_params)
      if @skill.save
        redirect_to root_path
      else
        render :new
      end
    end
  
  
    def show
      @judge = Judge.new
  
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
      params.require(:skill).permit(:judge_correct_id, :difficulity_id, :gif_url, :movie, :description,:video).merge(user_id: current_user.id)
    end
  
  end
  
  
end
