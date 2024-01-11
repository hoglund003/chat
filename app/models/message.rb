class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :text, presence: true, allow_blank: false

  after_create_commit :broadcast_create
  def broadcast_create
    broadcast_append_to(
      :messages,
      target: "messages",
      partial: "messages/message",
      locals: { message: self, channel: self.channel }
    )
  end
end
