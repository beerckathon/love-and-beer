class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new index create]
  protect_from_forgery 
  def new
    @post = Post.new
  end

  def temp
    @posts = Post.all
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def cheer
    @post = Post.find_by(id: params[:post_id])
    @user = @post.user
    if @post.destroy
      @user.cheer += 1
      @user.save
    end
  end

  private

  def post_params
    nm = Natto::MeCab.new
    content = ""
    nm.parse(params.require(:post).permit(:message)[:message]) do |n|
      if Ngword.exists?(name: n.feature.split(",")[6])
        content += "🍺" * n.surface.length
      else
        content += n.surface
      end
    end
    params.require(:post).permit(:message)
    {
      message: params.require(:post).permit(:message)[:message],
      content: content
    }
  end
end
