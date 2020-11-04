class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @skills = @user.skills
    @skill = Skill.find(params[:id])
  end
end
