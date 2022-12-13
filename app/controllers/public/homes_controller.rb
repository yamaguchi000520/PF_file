class Public::HomesController < ApplicationController
  def top
  end

  def about
    @home = Home.find_by(id: params[:id])
    @homes = Home.all
  end
end
