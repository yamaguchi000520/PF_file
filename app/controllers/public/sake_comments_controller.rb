class Public::SakeCommentsController < ApplicationController

  def create
    @sake = Sake.find(params[:sake_id])
    comment = current_customer.sake_comments.new(sake_comment_params)
    comment.sake_id = sake.id
    comment.save
  end

  def edit
  end

  def update

  end

  def destroy
    @sake = SakeComment.find(params[:sake_id])
    @sake.destroy
  end

  private

  def sake_comment_params
    params.require(:sake_comment).permit(:comment)
  end

end
