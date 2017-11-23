require 'pry'


class Message
  def initialize(message)
    @message = message.upcase.gsub(/\s+/,"").gsub("J","I")
  end

  attr_accessor :message, :a

  def message_split(message)
    @a = message.split('')
    a.each_with_index do |x, index|
        next_x = a[index + 1]
      a.insert(index + 1,'X')  if x == next_x
    end
    a << "X" if a.size.odd?
    return a
  end
end
# c = Message.new('message')
