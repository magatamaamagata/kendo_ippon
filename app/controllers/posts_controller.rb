class PostsController < ApplicationController
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
end

def post_params
  params.require(:post).permit(:judge_correct_id, :difficulity_id).merge(user_id: current_user.id)
end