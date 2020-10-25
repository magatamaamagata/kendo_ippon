class JudgesController < ApplicationController
  def create
    @judge = Judge.new(judge_params)
    @judge.save
  end

  def show
    @judge = Judge.find(params[:id])
    @judges = Judge.includes(:post).order('created_at DESC')
  end

private
  def judge_params
    params.require(:judge,:comment).permit(:judge)
  end
end
