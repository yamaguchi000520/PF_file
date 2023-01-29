class Public::SakesController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]
  def index
    @sake = Sake.new
    @sakes = Sake.page(params[:page]).per(5)
    @genres = Genre.all
  end

  def show
    @sake = Sake.find(params[:id])
    @genre = @sake.genre
    @sake_comment = SakeComment.new
    @customer = @sake.customer
  end

  def create
    @sake = Sake.new(sake_params)
    @sake.customer_id = current_customer.id
    if @sake.save
      flash[:notice] = "投稿が成功しました。"
      redirect_to sake_path(@sake.id)
    else
      @genres = Genre.all
      @sakes = Sake.all
      @customer = current_customer
      render "new"
    end
  end

  def edit
    @sake = Sake.find(params[:id])
    @genres = Genre.all
    if @sake.customer == current_customer
      render "edit"
    else
      redirect_to sakes_path
    end
  end

  def update
    @sake = Sake.find(params[:id])
    if @sake.update(sake_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to sakes_path
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @sake = Sake.find(params[:id])
    @sake.destroy
    redirect_to sakes_path
  end

  def new
    @sake = Sake.new
  end

  def follows
    customer = Customer.find(params[:id])
    @customers = customer.following_cosutomer.all
  end

  def followeds
    customer = Customer.find(paramas[:id])
    @customers = customer.follower_customer_all
  end

  def genre_search
    @sake = Sake.new
    @genres = Genre.all
    @search_genre = params[:genre]
    @sakes_all = Genre.search_for(@search_name)
    @sakes = Kaminari.paginate_array(Genre.search_for(@search_genre)).page(params[:page]).per(5)
  end

  private

  def sake_params
    params.require(:sake).permit(:genre_id,:name,:price,:introduction,:sake_image,:rate,:url)
  end

  def ensure_correct_customer
    @sake = Sake.find(params[:id])
    unless @sake.customer == current_customer
      redirect_to sakes_path
    end
  end
end