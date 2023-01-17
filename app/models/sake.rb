class Sake < ApplicationRecord

  belongs_to :customer
  belongs_to :genre, optional: true
  belongs_to :tag, optional: true
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :sake_comments, dependent: :destroy

  validates :name, presence:true
  validates :introduction, presence:true
  validates :genre_id, presence:true
  # URLでAmazonがある時のみ許可
  validates :url, format: { with: /https:\/\/www\.amazon\.co\.jp.*/ }, allow_blank: true

  has_one_attached :sake_image

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def bookmarked_by?(customer)
    bookmarks.exists?(customer_id: customer.id)
  end

  # 画像がない場合、no_image
  def get_sake_image(width, height)
    unless sake_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sake_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
    end
    sake_image.variant(resize_to_limit: [width, height]).processed
  end

  # 検索機能
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
