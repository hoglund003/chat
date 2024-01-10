module MessageHelper
  def sent_at(message)
    message.created_at.strftime("%H:%M %d/%m")
  end
end
