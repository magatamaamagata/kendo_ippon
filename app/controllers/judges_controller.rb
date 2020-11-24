class JudgesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  def new
    @post = Post.find(params[:post_id])
    @judge = Judge.new
    render layout: 'quiz_top'
  end

  def create
    @judge = Judge.new(judge_params)
    @judge.save
    redirect_to post_judge_path(params[:post_id], @judge.id)
  end

  def edit
    @post = Post.find(params[:post_id])
    @judge = Judge.find_by(post_id: params[:post_id])
    render layout: 'quiz_top'
  end

  def update
    @judge = Judge.update(judge_params)
    redirect_to post_judge_path(params[:post_id], @judge)
  end

  def show
    @judge = Judge.find(params[:id])
    render layout: 'quiz_top'
  end

  private

  def judge_params
    @post = Post.find(params[:post_id])
    params.require(:judge).permit(:judge_correct_id).merge(user_id: current_user.id, post_id: @post.id)
  end
end
