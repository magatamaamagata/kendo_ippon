class UsersController < ApplicationController
  before_action :check_guest, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

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
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
  
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com', nickname: '浪人', grade_id: 2) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  private
  def user_params
    params.require(:user).permit(:nickname,:email,:grade_id)
  end

  def check_guest
    # 以下のメールアドレスのユーザーが変更や削除を行おうとした時はマイページに飛ばす
    if user_signed_in? && current_user.email == 'guest@example.com'
      flash[:ng] = 'ゲストユーザーの変更・削除はできません。'
      redirect_to user_path(current_user)
    end
  end

end
