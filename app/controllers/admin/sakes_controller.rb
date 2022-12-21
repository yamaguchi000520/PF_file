class Admin::SakesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @sakes = Sake.all
  end

  def show
    @sake = Sake.find(params[:id])
    @genre = @sake.genre
  end

  def destroy
    @sake = Sake.find(params[:id])
  end
end
