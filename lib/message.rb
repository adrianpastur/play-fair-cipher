require 'pry'


class Message
  def initialize(message)
    @message = message.upcase.gsub(/\s+/,"").gsub("J","I")
  end

  attr_accessor :message, :new_message

  def message_split(message)
    @new_message = message.split('')
    new_message.each_with_index do |x, index|
        next_x = new_message[index + 1]
      new_message.insert(index + 1,'X')  if x == next_x
    end
    new_message << "X" if new_message.size.odd?
    return new_message
  end
end
