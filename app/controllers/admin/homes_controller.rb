class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
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
  end

  def update
    @home = Home.find(params[:id])
    if @home.update(home_params)
      flash[:notice] = "編集を保存しました。"
      redirect_to admin_homes_about_path
    else
      flash[:notice] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to request.referer
  end

  private

  def home_params
    params.require(:home).permit(:name,:introduction)
  end
end