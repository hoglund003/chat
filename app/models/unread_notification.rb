class UnreadNotification < ApplicationRecord
  belongs_to :user
  belongs_to :message
  delegate :channel, :to => :message
end
