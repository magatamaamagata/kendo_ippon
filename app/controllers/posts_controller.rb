class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :move_to_index, only: [:edit, :update, :delete]
  def index
    @posts = Post.includes(:user).order('created_at DESC')
    render layout: 'react'
  end

  def new
    @post = Post.new
    render layout: 'quiz_top'
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @judge = Judge.find_by(post_id: params[:id])
    # binding.pry
    @ok_or_ng = if !@judge.nil? && @post.judge_correct.id == @judge.judge_correct.id
                  '正解'
                else
                  '不正解'
                end
    render layout: 'quiz_top'
  end

  def edit
    render layout: 'quiz_top'
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to posts_path unless user_signed_in? && (current_user.id == @post.user_id)
  end

  def post_params
    params.require(:post).permit(:judge_correct_id, :difficulity_id, :gif_url, :movie, :description, :video).merge(user_id: current_user.id)
  end
end
