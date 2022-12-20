class Admin::SakesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @sakes = Sake.all
  end

  def destroy
    @sake = Sake.find(params[:id])
  end
end
