class ComparesController < ApplicationController

  def new
    @compare = Compare.new
  end

  def create
    @compare = Compare.new(compare_params)
    if @compare.save
      redirect_to skill_path(params[:id])
    else
      render :new
    end
  end

private
  def compare_params
    @skill = Skill.find(params[:id])
    params.require(:compare).permit(:sprits, :posture,:bamboo,:position,:sword,:zanshin,:sprits2,:posture2,:bamboo2,:position2,:sword2,:zanshin2,:notice).merge(skill_id: params[:skill_id])
  end
end
