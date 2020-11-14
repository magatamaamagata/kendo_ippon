class UsersController < ApplicationController
  before_action :check_guest, only: [:update, :destroy]

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

  def check_guest
    # 以下のメールアドレスのユーザーが変更や削除を行おうとした時はマイページに飛ばす
    if resource.email == 'guest@example.com'
      redirect_to user_path(user), alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end
end
