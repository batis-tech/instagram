class AccountsController < ApplicationController
  #devvise model name account
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
  def index
    #user dashboard
    @posts = Post.active

  end

  def profile
   @posts = @account.posts.active
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
