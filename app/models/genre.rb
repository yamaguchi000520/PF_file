class Genre < ApplicationRecord

  has_many :sakes, dependent: :destroy

  validates :name, presence:true

  def self.search_for(content)
    genres = Genre.where("name LIKE?", "#{content}")
    genres.inject(init = []){|result, name| result + name.sakes}
  end
end
