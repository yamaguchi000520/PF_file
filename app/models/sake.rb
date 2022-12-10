class Sake < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  belongs_to :tag
  has_many :favorites, dependent: :destroy
  has_many :sake_comments, dependent: :destroy

  has_one_attached :image

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end


  def get_image(width,height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
  end


end
