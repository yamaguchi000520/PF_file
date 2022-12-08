class Public::SakeCommentsController < ApplicationController

  def create
    sake = Sake.find(params[:sake_id])
    comment = current_customer.sake_comments.new(sake_comment_params)
    comment.sake_id = sake.id
    comment.save
    redirect_to sake_path(sake)
  end

  def edit
  end

  def update

  end

  def destroy
    SakeComment.find(params[:id]).destroy
    redirect_to sake_path(params[:sake_id])
  end

  private

  def sake_comment_params
    params.require(:sake_comment).permit(:comment)
  end

end
