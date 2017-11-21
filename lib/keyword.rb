require 'pry'


class Keyword
  def initialize(keyword)
    @keyword = keyword_unique(keyword.upcase.gsub("J","I"))
  end
attr_accessor :keyword

private

  def keyword_unique(keyword)
    kw = keyword.gsub(/\s+/, "")
    result = ''
    kw_array = [kw]
    kw_array = kw_array.first.chars.each_slice(1).to_a.map(&:join)
    kw_array = kw_array.uniq

    kw_array.each {|k| result += k}
    result
  end
end
