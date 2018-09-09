class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :replies
  has_many :favorites, dependent: :destroy
  has_many :replied_games, through: :replies, source: :game
  has_many :favorited_games, through: :favorites, source: :game

end
