class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  def create
    @sake = Sake.find(params[:sake_id])
    favorite = current_customer.favorites.new(sake_id: @sake.id)
    favorite.save
  end

  def destroy
    @sake= Sake.find(params[:sake_id])
    favorite = current_customer.favorites.find_by(sake_id: @sake.id)
    favorite.destroy
  end
end