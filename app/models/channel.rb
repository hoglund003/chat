class Channel < ApplicationRecord
  has_many :messages
  has_many :unread_notifications, through: :messages

  validates :name, uniqueness: true, presence: true, allow_blank: false
end
