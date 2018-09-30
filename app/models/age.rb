class Age < ApplicationRecord
  has_many :age_games
  has_many :suitable_games, through: :age_games, source: :game
end
