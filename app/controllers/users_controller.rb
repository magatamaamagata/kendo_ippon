class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @skills = @user.skills
    @skill = Skill.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:nickname,:email,:grade_id)
  end
end
