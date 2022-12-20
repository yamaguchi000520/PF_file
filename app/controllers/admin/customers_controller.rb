class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update!(customer_params)
      flash[:notice] = "会員情報の更新に成功しました。"
      redirect_to admin_customer_path(@customer.id)
    else
      flash[:notice] = "情報の更新に失敗しました。"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:introduction,:email,:profile_image)
  end
end
