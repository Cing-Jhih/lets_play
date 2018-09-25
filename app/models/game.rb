class Game < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, counter_cache: :games_count
  has_many :age_games, dependent: :destroy
  has_many :situation_games, dependent: :destroy
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  has_many :replies
  has_and_belongs_to_many :tags
  has_many :suitable_ages, through: :age_games, source: :age

  after_create do
    game = Game.find_by(id: self.id)
    hashtags = self.step.encode('utf-8').scan(/#[\u4e00-\u9fa5_a-zA-Z0-9]+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      game.tags << tag
    end
  end

  before_update do
    game = Game.find_by(id: self.id)
    game.tags.clear
    hashtags = self.step.scan(/#[\u4e00-\u9fa5_a-zA-Z0-9]+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      game.tags << tag
    end
  end

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

  def suitable_age?(user)
    self.suitable_ages.where(old: user.kid_age).present?
  end

end
