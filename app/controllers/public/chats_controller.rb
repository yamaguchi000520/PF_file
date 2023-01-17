class Public::ChatsController < ApplicationController
  # 相互フォローしている場合にチャットを許可する時は下記のコメントアウトを解除
  # before_action :regect_non_related, only: [:show]

  def show
    @customer = Customer.find(params[:id])
    rooms = current_customer.dm_rooms.pluck(:room_id)
    dm_rooms = DmRoom.find_by(customer_id: @customer.id, room_id: rooms)
    unless dm_rooms.nil?
      @room = dm_rooms.room
    else
      @room = Room.new
      @room.save
      DmRoom.create(customer_id: current_customer.id, room_id: @room.id)
      DmRoom.create(customer_id: @customer.id, room_id: @room.id)
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_customer.chats.new(chat_params)
    render :validater unless @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

  # 相互フォローしている場合にチャットを許可する時は下記のコメントアウトを解除
  # def regect_non_related
  #   customer = Customer.find(params[:id])
  #   unless current_customer.following?(customer) && customer.following?(current_customer)
  #     redirect_to sakes_path
  #   end
  # end
end