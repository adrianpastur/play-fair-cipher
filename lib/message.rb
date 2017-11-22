require 'pry'


class Message
  def initialize(message)
    @message = message.upcase.gsub(/\s+/,"").gsub("J","I")
    possible_pairs
  end

  attr_accessor :message, :p_pairs

  def possible_pairs
    a = ("A".."Z").to_a
    b = a
    c = [a,b]
    @p_pairs = c.transpose.map {|x| x.reduce(:+)}
  end

  def message_split(message)
    message += "X"  if message.length.odd?
    new_string = ""
    a = message.chars.each_slice(2).map(&:join)
    a.each do  |x|  if p_pairs.include? x
        p x
        new_string += x.chars.first + "X"
      else
        p x
        new_string += x
      end
    end
    new_string
  end
  binding.pry
end
