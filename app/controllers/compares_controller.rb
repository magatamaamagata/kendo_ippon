class ComparesController < ApplicationController
    before_action :set_compare, only: [:show, :edit, :destroy ,:update]
    # before_action :authenticate_user!, only: [:new,:edit,:update]
    # before_action :move_to_index, only: [:edit, :update, :delete]
  
    def index
      @compare = Compare.find(params[:skill_id])
      @skill = Skill.find(params[:skill_id])
      @comment = Comment.new
      @comments = Comment.includes(:user,:skill,:compare).order('created_at DESC')
    end
  
    def create
      @compare = Compare.new(compare_params)
      if @compare.save
        redirect_to skill_compares_path
      else
        render :new
      end
    end
  
    private
    def set_compare
      @compare = Compare.find(params[:id])
    end
  
    def move_to_index
      unless user_signed_in? && (current_user.id == @compare.user_id)
        redirect_to root_path 
      end
    end
  
    def compare_params
      @skill = Skill.find(params[:skill_id])
      params.require(:compare).permit(:sprits, :posture,:bamboo,:position,:sword,:zanshin,:sprits2,:posture2,:bamboo2,:position2,:sword2,:zanshin2,:notice,:public).merge(skill_id: @skill.id, compare_id:@skill.id)
    end
  
end
