class Channel < ApplicationRecord
  has_many :messages

  validates :name, uniqueness: true, presence: true, allow_blank: false
end
