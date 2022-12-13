class Admin::SakesController < ApplicationController
  def index
    @sakes = Sake.all
  end

  def destroy
    @sake = Sake.find(params[:id])
  end
end
