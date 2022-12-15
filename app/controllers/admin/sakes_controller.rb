class Admin::SakesController < ApplicationController
  befor_action :authenticate_admin!
  def index
    @sakes = Sake.all
  end

  def destroy
    @sake = Sake.find(params[:id])
  end
end
