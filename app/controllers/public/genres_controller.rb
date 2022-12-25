class Public::GenresController < ApplicationController
  def index
    @genre = Genre.find_by(:id params[id])
    @genres = Genre.all
  end
end
