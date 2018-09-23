class Followship < ApplicationRecord

  # 確保特定 user_id 下，只能有一個 followings_id
  validates :following_id, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :following, class_name: "User"
end
