class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @post = Post.new(post_params)

      if @post.save
          redirect_to new_user_path
      else
          render :new, status: :unprocessable_entity
      end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title,:description)
  end
end
