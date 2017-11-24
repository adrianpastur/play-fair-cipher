require 'rspec'
require_relative '../lib/keyword'

describe Keyword do
  let(:keyword) { Keyword.new('keyword') }
  let(:keyword_J) {Keyword.new('keywordj')}
  let(:keyword_repeating) {Keyword.new('keeywwoord')}
  let(:keyword_space) {Keyword.new('key word')}
  it 'takes string and stores value in upcase' do
    expect(keyword.keyword).to eq('KEYWORD')
  end

  it 'replaces J inside string to I' do
    expect(keyword_J.keyword).to eq('KEYWORDI')
  end

  it 'removes repeating characters' do
    expect(keyword_repeating.keyword).to eq('KEYWORD')
  end

  it 'removes white space inside string' do
    expect(keyword_space.keyword).to eq('KEYWORD')
  end

end
