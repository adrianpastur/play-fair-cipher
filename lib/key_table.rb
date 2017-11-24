require 'pry'
require_relative 'keyword'

class Table
  def initialize(keyword)
    @keyword = Keyword.new(keyword)
    @board = []
    @keyword_array = keyword.upcase.split(//)
  end

  attr_accessor :board, :keyword
  attr_reader :keyword_array

  ALPHABET = ("A".."Z").to_a
  ALPHABET.delete('J')

  def fill_table(keyword)
    keyword_array.each {|k| board << k}
    a = ALPHABET - keyword_array
    a.each {|k| board << k}
    board.each_slice(5).to_a
  end
end
