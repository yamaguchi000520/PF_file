class Sake < ApplicationRecord

  belongs_to :customer
  belongs_to :tag
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


end
