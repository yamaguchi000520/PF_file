class Admin::SakeCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @sake = Sake.find(params[:sake_id])
    SakeComment.find(params[:id]).destroy
  end
end