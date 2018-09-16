class Reply < ApplicationRecord
  belongs_to :user, counter_cache: :replies_count
  belongs_to :game, counter_cache: :replies_count
end
