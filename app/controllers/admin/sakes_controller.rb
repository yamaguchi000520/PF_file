class Admin::SakesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @sakes = Sake.page(params[:page]).per(20)
  end

  def show
    @sake = Sake.find(params[:id])
    @genre = @sake.genre
  end

  def destroy
    @sake = Sake.find(params[:id])
    @sake.destroy
    redirect_to admin_sakes_path
  end
end