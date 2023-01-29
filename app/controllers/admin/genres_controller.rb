class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page]).per(10)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの登録に成功しました。"
      redirect_to request.referer
    else
      @genres = Genre.page(params[:page]).per(10)
      flash[:notice] = "ジャンルの登録に失敗しました。"
      #redirect_to request.referer
      render :index
      # render 'errors'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "変更が完了しました。"
      redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンル名を入力してください。"
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
