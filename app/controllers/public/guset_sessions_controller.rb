class Public::GusetSessionsController < ApplicationController
  def guest_sign_in
    # customer = Customer.find_or_create_by(name: 'guest' ,email: 'guest@example.com') do |customer|
    #   customer.password = SecureRandom.urlsafe_base64
    #   customer.name = "ゲスト会員"
    # end
    # session[:customer_id] = customer.id
    # flash[:notice] = "GUESTでログインしました。"
    # redirect_to root_path
    
    customer = Customer.guest
    sign_in customer
    flash[:notice] = "GUESTでログインしました。"
    redirect_to root_path
  end
end
