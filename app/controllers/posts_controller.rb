class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    # Creates post through user
    @post = current_user.posts.new(post_params)

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
