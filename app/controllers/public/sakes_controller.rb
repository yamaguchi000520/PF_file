class Public::SakesController < ApplicationController
  def index
    @sake = Sake.new
    @sakes = Sake.all
    # @genre = Genre.find(params[:genre_id])
    @genres = Genre.all
  end

  def show
    @sake = Sake.find(params[:id])
    @genre = @sake.genre
    @sake_comment = SakeComment.new
    @customer = Customer
  end

  def create
    @sake = Sake.new(sake_params)
    @sake.customer_id = current_customer.id
    if @sake.save
      flash[:notice] = "投稿が成功しました。"
      redirect_to sake_path(@sake.id)
    else
      flash[:notice] = "未入力項目があります。"
      @genres = Genre.all
      @sake = Sake.new(sake_params)
      @sakes = Sake.all
      @customer = current_customer
      render "index"
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
      redirect_to :show
    else
      flash[:notice] = "未入力欄があります。"
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @sake = Sake.find(params[:id])
    @sake.destroy
    redirect_to sakes_path
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
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @sakes = @genre.sakes.order(created_at: :desc).all
    else
      @sakes= Genre.order(created_at: :desc).all
    end
    # @genres = Genre.all
    # @genre = Genre.find(params[:genre_id])
    # @search = params[:genre]
    # @sakes_many = Sake.search_for(@search)
    # @sakes = Genre.search_for(@search)
  end

  private

  def sake_params
    params.require(:sake).permit(:genre_id,:name,:price,:introduction,:sake_image)
  end

  # def current_customer
  #   @sake = Sake.find(params[:id])
  #   @customer = @sake.customer
  #   redirect_to(sakes_path) unless @customer == current_customer
  # end
end
