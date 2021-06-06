class LikesController < ApplicationController

  before_action :authenticate_account!

  def save_like
    @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
    @post_id = params[:post_id]
    existing_like = Like.where(post_id: params[:post_id], account_id: current_account.id)

      respond_to do |format|
        format.js{
          #this to check if he likes a post then dislike it if not then like it
          if existing_like.any?
             existing_like.first.destroy
             @success = false
          elsif @like.save
              @success = true
            else
              @success = false
            end
            #render js file from the views
              render "posts/like"
              @post_likes = Post.find(@post_id).total_likes_count
      }
    end
  end
end
