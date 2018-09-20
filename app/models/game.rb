class Game < ApplicationRecord
  belongs_to :user, counter_cache: :games_count
  has_many :age_games, dependent: :destroy
  has_many :situation_games, dependent: :destroy
  has_many :favorites
  has_many :replies
  has_and_belongs_to_many :tags

  after_create do
    game = Game.find_by(id: self.id)
    hashtags = self.step.scan(/#\w+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      game.tags << tag
    end  
  end

  before_update do
    game = Game.find_by(id: self.id)
    game.tags.clear
    hashtags = self.step.scan(/#\w+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      game.tags << tag
    end  
  end
end
