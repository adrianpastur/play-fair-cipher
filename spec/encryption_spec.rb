require 'rspec'
require_relative '../lib/encrypt'
require_relative '../lib/decrypt'

describe Encrypt do

  let(:encrypt) { Encrypt.new('message','keyword') }


  it 'splits stored message in to digraph' do
    expect(encrypt.split_message).to eq(["ME", "SX", "SA", "GE"])
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
    expect(encrypt.message_transform(encrypt.split_message)).to eq("NKQZPCND")
  end


end

describe Decrypt do
  let(:decrypt) { Decrypt.new('NKQZPCND','keyword') }
  it 'returns original string' do
    expect(decrypt.return_reformed_decrypted_message(decrypt.transformed_message)).to eq('MESSAGE')
  end
end
