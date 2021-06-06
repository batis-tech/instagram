class AccountsController < ApplicationController
  #devvise model name account
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
  def index
    #user dashboard
    @posts = Post.active
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @followers_suggestions= Account.where.not(id: following_ids)

  end

  def profile
   @posts = @account.posts.active
  end
  def follow_account
   follower_id = params[:follow_id]
   Follower.create(follower_id: current_account.id, following_id: follower_id)

   redirect_to dashboard_path
  end
  private
  def set_account
    @account = Account.find_by_username(params[:username])
  end

end
