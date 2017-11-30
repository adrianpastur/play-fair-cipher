require 'pry'


class Keyword
  def initialize(keyword)
    @keyword = keyword_unique(keyword.upcase.gsub('J','I'))
  end
attr_accessor :keyword

private

  def keyword_unique(keyword)
    key_word = keyword.gsub(/\s+/, '')
    result = ''
    key_word_array = [key_word]
    key_word_array = key_word_array.first.chars.each_slice(1).to_a.map(&:join)
    key_word_array = key_word_array.uniq
    key_word_array.each {|x| result += x}
    #key_word_array.uniq.each { |keyword| result += keyword }
    result
  end
end
