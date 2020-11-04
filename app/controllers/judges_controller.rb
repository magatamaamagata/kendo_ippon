class JudgesController < ApplicationController
  def index
    @judge = Judge.find(params[:post_id])
    @judges = Judge.includes(:post).order('created_at DESC')
  end

  def create
    judge = Judge.new(judge_params)
    judge.save
    redirect_to action: :index
  end

  private

  def judge_params
    @post = Post.find(params[:post_id])
    params.require(:judge).permit(:comment, :judge_correct_id).merge(user_id: current_user.id, post_id: @post.id)
  end
end
