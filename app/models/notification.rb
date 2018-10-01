class Notification < ApplicationRecord
  belongs_to :message
  belongs_to :receiver, class_name: "User"
end
