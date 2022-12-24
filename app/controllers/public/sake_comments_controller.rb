class Public::SakeCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @sake = Sake.find(params[:sake_id])
    comment = current_customer.sake_comments.new(sake_comment_params)
    comment.sake_id = @sake.id
    comment.save

    # @sake_comment = SakeComments.new(sake_comment_params)
    # @sake_comment.sake_id = @sake.id
    # @sake_comment.customer_id = current_customer.id
    # @sake_comment.save
  end

  def edit
  end

  def update

  end

  def destroy
    @sake = Sake.find(params[:sake_id])
    SakeComment.find(params[:id]).destroy
  end

  private

  def sake_comment_params
    params.require(:sake_comment).permit(:comment)
  end

end
