class Room < ApplicationRecord

  has_many :dm_rooms
  has_many :chats

end