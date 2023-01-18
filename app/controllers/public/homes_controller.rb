class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @sakes = Sake.all
  end

  def about
    @homes = Home.all
  end
end