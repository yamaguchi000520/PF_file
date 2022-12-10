class Public::CustomersController < ApplicationController
  def show
    @customer = current.customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報の変更が完了しました。"
      redirect_to customers_my_page_path
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

  private

  def customer_params
   params.require(:customer).permit(:first_name, :last_name, :first_kana, :last_kana, :zip, :address, :phone_number, :email)
  end
end
