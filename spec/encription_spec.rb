require 'rspec'
require_relative '../lib/encrypt'

describe Encrypt do

  let(:encrypt) { Encrypt.new('message','keyword') }

  it 'splits stored message in to digraph' do
    expect(encrypt.split_message).to eq(["ME", "SX", "SA", "GE"])
    binding.pry
  end

  it 'retrieves given pair of characters from digraph' do
    expect(encrypt.retrieve_pair(0)).to eq(['M','E'])
  end

  it 'locates character from keyword table in given row and column' do
    expect(encrypt.locate_character(0,0)).to eq('K')
  end

  it 'retrieves integer array for given character to be located in keyword table' do
    expect(encrypt.element_location('K')).to eq([0,0])
  end

  it 'checks if two characters are on the same row' do
    expect(encrypt.element_same_row?('K','E')).to eq(true)
  end

  it 'checks if two characters are on the same column' do
    expect(encrypt.element_same_column?('K','R')).to eq(true)
  end

  it 'returns string as encrypted message' do
    expect(encrypt.message_encryption(encrypt.split_message)).to eq("NKQZPCND")
  end

  it 'returns original string' do
    c = Encrypt.new('NKQZPCND','keyword')
    expect(c.message_decryption(c.split_message)).to eq('MESSAGE')
  end
end
