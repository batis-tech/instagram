class PostsController < ApplicationController

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to dashboard_url, flash: {success:"your image has been uploaded"}
    else
      redirect_to new_post_path, flash: {danger:"your image has been uploaded"}
    end

  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache)
  end
end