class Favorite < ApplicationRecord
  belongs_to :user, counter_cache: :favorites_count
  belongs_to :game, counter_cache: :favorites_count
end
