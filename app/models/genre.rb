class Genre < ApplicationRecord

  has_many :sakes, dependent: :destroy

  validates :name, presence:true
end
