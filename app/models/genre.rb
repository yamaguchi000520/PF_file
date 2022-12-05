class Genre < ApplicationRecord

  has_many :sakes, dependent: :destroy


end
