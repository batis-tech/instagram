class CommentsController < ApplicationController
  before_action :authenticate_account!

  def create
    @comment = Comment.new(comment_params)
    @comment.account_id = current_account.id if account_signed_in?

    if @comment.save
      return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : dashboard_path
      redirect_to dashboard_path, flash: {success:"your comment has been uploaded"}
    else
      redirect_to dashboard_path, flash: {danger:"your comment has been uploaded"}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :return_to)
  end
end
