class ComparesController < ApplicationController

  def new
    @skill = Skill.find(params[:skill_id])
    @compare = Compare.new
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

private
  def compare_params
    params.require(:compare).permit(:sprits, :posture,:bamboo,:position,:sword,:zanshin,:sprits2,:posture2,:bamboo2,:position2,:sword2,:zanshin2,:notice,:public_id).merge(skill_id: params[:skill_id])
  end
end
