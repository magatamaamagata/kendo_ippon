class JudgesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @judge = Judge.new
  end

  def create
    @judge = Judge.new(judge_params)
    @judge.save
    redirect_to post_judge_path(params[:post_id],@judge.id)
  end

  def show
   @judge = Judge.find(params[:id])
  end

  private

  def judge_params
    @post = Post.find(params[:post_id])
    params.require(:judge).permit(:judge_correct_id).merge(user_id: current_user.id, post_id: @post.id)
  end
end
