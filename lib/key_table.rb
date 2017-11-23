require 'pry'
require_relative 'keyword'

class Table
  def initialize(keyword)
    @keyword = Keyword.new(keyword)
    @board = []
  end

  attr_accessor :board, :keyword

  ALPHABET = ("A".."Z").to_a
  ALPHABET.delete('J')

  def keyword_to_kt(keyword)
    k_array = keyword.keyword.split(//)
    k_array.each {|k| board << k}
  end

  def populate_kt(keyword)
    k_array = keyword.keyword.split(//)

    a = ALPHABET - k_array
    a.each {|k| board << k}
    board.each_slice(5).to_a
  end

  def fill_table(keyword)
    keyword_to_kt(keyword)
    populate_kt(keyword)
  end

end
