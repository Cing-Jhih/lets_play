class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User"
  has_one :notification
  validates_presence_of :content

  after_create do
    Notification.create(message_id: self.id, user_id: self.receiver_id)
  end
end
