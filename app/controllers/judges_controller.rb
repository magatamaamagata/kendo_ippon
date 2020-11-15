class JudgesController < ApplicationController
  def index
    # @post=Post.find(params[:post_id])
    # @judge = Judge.find(@post.judge.id)
    @judges = Judge.includes(:post).order('created_at DESC')
  end

  def create
    @judge = Judge.new(judge_params)
    if @judge.save && (@judge.post.judge_correct_id == @judge.judge_correct_id)
      redirect_to post_judges_path
    else
      # flash[:ng] = "外れです"
      redirect_to posts_path
    end
  end

  private

  def judge_params
    @post = Post.find(params[:post_id])
    params.require(:judge).permit(:judge_correct_id).merge(user_id: current_user.id, post_id: @post.id)
  end
end
