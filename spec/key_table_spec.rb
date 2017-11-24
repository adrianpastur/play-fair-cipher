require 'rspec'
require_relative '../lib/key_table'

describe Table do

  let(:table) { Table.new('keyword') }

  it 'adds keyword instance to array' do
    expect(table.keyword_array.each {|k| table.board << k}).to eq(table.board)
  end

  it 'fills the rest of the table with the remaining letters of the alphabet' do
    expect(table.fill_table(table.keyword)).to eq([["K", "E", "Y", "W", "O"], ["R", "D", "A", "B", "C"], ["F", "G", "H", "I", "L"], ["M", "N", "P", "Q", "S"], ["T", "U", "V", "X", "Z"]])
  end

end
