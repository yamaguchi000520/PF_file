class Public::HomesController < ApplicationController
  def top
  end

  def about
    @homes = Home.all
  end
end
