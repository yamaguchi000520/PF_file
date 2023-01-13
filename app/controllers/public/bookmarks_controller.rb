class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def create
    @sake = Sake.find(params[:sake_id])
    bookmark = current_customer.bookmarks.new(sake_id: @sake.id)
    bookmark.save
  end

  def destroy
    @sake= Sake.find(params[:sake_id])
    bookmark = current_customer.bookmarks.find_by(sake_id: @sake.id)
    bookmark.destroy
  end
end
