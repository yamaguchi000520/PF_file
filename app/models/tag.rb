class Tag < ApplicationRecord

  has_many :sakes, dependent: :destroy

end