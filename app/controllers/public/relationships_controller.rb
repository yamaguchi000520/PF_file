class Public::RelationshipsController < ApplicationController
  before_action :authenticate_customer!

  def create
    customer = Customer.find(params[:customer_id])
    current_customer.follow(customer)
    redirect_to request.referer
  end

  def destroy
    customer = Customer.find(params[:customer_id])
    current_customer.unfollow(customer)
  end

  def followers
    @customer = Customer.find_by(id: params[:customer_id])
    @customers = []
    if @customer != nil
      @customers = @customer.followers
    end
  end

  def followings
    @customer = Customer.find_by(id: params[:customer_id])
    @customers = []
    if @customer != nil
      @customers = @customer.followings
    end
  end
end