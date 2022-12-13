class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @sakes = @customer.sakes
    @sake = Sake.new
  end

  def index
    @customer = Customer.find_by(id: params[:id])
    @customers = Customer.all
    @sake = Sake.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "登録情報の変更が完了しました。"
      redirect_to customer_path
    else
      flash[:notice] = "登録情報の変更に失敗しました。"
      render 'edit'
    end
  end

  def unsubscribe
  end

  #退会アクション
  def is_deleted
    @customer = current_customer
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def follows
    customer = Customer.find(params[:id])
    @customers = customer.following_user.all
  end

  def followers
    customer = Customer.find(params[:id])
    @customers = customer.follower_customer.all
  end

  private

  def customer_params
   params.require(:customer).permit(:name, :introduction, :email,:profile_image)
  end
end
