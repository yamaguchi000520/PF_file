class Genre < ApplicationRecord

  has_many :sakes, dependent: :destroy

  # def self.search_for(content)
  #   genres = Genre.where("genre LIKE?", "#{content}")
  #   genres.inject(init = []){|result, genre| result + genre.sakes}
  # end
end
