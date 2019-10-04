class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new index create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
    {
      message: params.require(:post).permit(:message)[:message],
      content: params.require(:post).permit(:message)[:message]
    }
  end
end
