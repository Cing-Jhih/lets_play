class Game < ApplicationRecord
  belongs_to :user, counter_cache: :games_count

  has_many :age_games, dependent: :destroy
  has_many :situation_games, dependent: :destroy
  has_many :favorites
  has_many :replies

end
