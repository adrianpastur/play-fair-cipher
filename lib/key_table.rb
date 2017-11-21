require 'pry'

class Cypher
  def initialize(keyword)
    @keyword = keyword
    @board = []
  end

  attr_accessor :board, :message
  attr_reader :keyword

  ALPHABET = ("a".."y").to_a

  def key_table(keyword)
    kw = keyword.gsub(/\s+/, "")
    kw_array = [kw]
    kw_array = kw_array.first.chars.each_slice(1).to_a.map(&:join)
    kw_array = kw_array.uniq

    kw_array.each {|k| board << k}
  end

  def populate_kt(board)
    a = ALPHABET - board
    a.each {|k| board << k}
    board.each_slice(5).to_a
  end

  def fill_table(kw_array, board)
    i = 0
    j = 0

    a = ALPHABET - kw_array

    board.each {|e|

      if e == nil
        e = a[i]
        i += 1
      end
      binding.pry
    }
  end


  binding.pry
end
