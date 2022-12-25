class SakeComment < ApplicationRecord

  belongs_to :customer
  belongs_to :sake

  validates :comment, presence:true

end
