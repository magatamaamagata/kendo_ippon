class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy ,:update]
  before_action :authenticate_user!, only: [:new,:edit,:update]
  before_action :move_to_index, only: [:edit, :update, :delete]
  def index
  end
  def new
    @post = Post.new
    # binding.pry
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in? && (current_user.id == @post.user_id)
      redirect_to root_path 
    end
  end

  def post_params
    params.require(:post).permit(:judge_correct_id, :difficulity_id).merge(user_id: current_user.id)
  end

end

