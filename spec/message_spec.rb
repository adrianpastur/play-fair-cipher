require 'rspec'
require_relative '../lib/message'

describe Message do

  let(:message) { Message.new('example') }
  let(:message_double_letters) { Message.new('examplej') }
  let(:message_space) { Message.new('ex am ple') }

  it 'will store a string in upcase' do
    expect(message.message).to eq('EXAMPLE')
  end

  it 'replaces J and I inside string' do
    expect(message_double_letters.message).to eq('EXAMPLEI')
  end

  it 'removes white space from message' do
    expect(message_space.message).to eq('EXAMPLE')
  end
end
