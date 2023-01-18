class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sakes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :sake_comments, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  has_many :dm_rooms
  has_many :chats
  has_many :room, through: :dm_rooms

  validates :name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :email, presence:true

  has_one_attached :profile_image

  # 画像ファイルについて
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: 'guest' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guest"
    end
  end

  # フォローフォロワー機能
  def follow(customer)
    relationships.create(followed_id: customer.id)
  end

  def unfollow(customer)
    relationships.find_by(followed_id: customer.id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end

  #退会機能
  # is_deletedがfalseならtrueを返すようにしている
  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設ける
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end
end