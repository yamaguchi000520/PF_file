class Admin::HomesController < ApplicationController
  def top
  end

  def about
    @home = Home.new
    @homes = Home.all
  end

  def create
    @home = Home.new(home_params)
    if @home.save
      flash[:notice] = "編集を保存しました。"
      redirect_to request.referer
    else
      @homes = Home.all
      flash[:notice] = "編集に失敗しました。"
      render :about
    end
  end

  def edit
    @home = Home.find(params[:id])

  def update
    @home = Home.find(params[:id])
    if @home.update(home_params)
      flash[:notice] = "編集を保存しました。"
      redirect_to request.referer
    else
      flash[:notice] = "編集に失敗しました。"
      render :edit
    end
  end

  private

  def home_params
    params.require(:home).permit(:name,:introduction,:image)
  end
end
