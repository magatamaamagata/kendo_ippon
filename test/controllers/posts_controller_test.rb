require '_helper'

class PostsController < ActionDispatch::Integration
   "should get index" do
    get posts_index_url
    assert_response :success
  end

end
