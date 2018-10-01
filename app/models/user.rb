class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  mount_uploader :avatar, AvatarUploader

  has_many :games
  has_many :replies
  has_many :favorites, dependent: :destroy
  has_many :replied_games, through: :replies, source: :game
  has_many :favorited_games, through: :favorites, source: :game
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user
  has_many :messages, dependent: :destroy
  has_many :receivers, through: :messages
  has_many :inverse_messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :senders, through: :inverse_messages, source: :user
  has_many :notifications

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.remote_avatar_url = auth.info.image
    user.save!
    return user
  end

  def kid_age
    if self.kid_birth.blank?
      return
    else
      now = Time.now.utc.to_date
      now.year - self.kid_birth.year - ((now.month > self.kid_birth.month || (now.month == self.kid_birth.month && now.day >= self.kid_birth.day)) ? 0 : 1)
    end
  end

  def following?(user)
    self.followings.include?(user)
  end

end
