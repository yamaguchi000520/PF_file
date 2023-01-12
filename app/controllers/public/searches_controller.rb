class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    elsif @range == "Sake"
      @sakes = Sake.looks(params[:search], params[:word])
    end
  end
end
