class Tag < ApplicationRecord

  validates :name, presence:true

  has_many :sakes, dependent: :destroy

end