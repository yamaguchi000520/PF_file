class Sake < ApplicationRecord

  belongs_to :customer
  belongs_to :genre
  belongs_to :tag, optional: true
  has_many :favorites, dependent: :destroy
  has_many :sake_comments, dependent: :destroy

  validates :name, presence:true
  validates :introduction, presence:true
  validates :genre_id, presence:true


  has_one_attached :sake_image

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  # def get_sake_image
  #   (sake_image.attached?) ? sake_image : 'no_image.jpg'
  # end
  # def get_image
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image
  # end

  def get_sake_image(width,height)
    if sake_image.attached?
      sake_image.variant(resize_to_limit: [width, height]).processed
    else
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sake_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @sake = Sake.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @sake = Sake.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @sake = Sake.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @sake = Sake.where("name LIKE?","%#{word}%")
    else
      @sake = Sake.all
    end
  end
end
