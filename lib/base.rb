require 'pry'
require_relative 'message'
require_relative 'key_table'

class Base
  def initialize(message,table)
    @message = Message.new(message)
    @table = Table.new(table)
    initialize_components
  end

  attr_accessor :message, :table, :board, :split_message, :transformed_message

  #the playfair-cipher array is always going to be 5x5, thus the following constant:
  ARRAY_SIZE = 5

  def initialize_components
    @board = table.fill_table(table.keyword)
    @split_message = message.message_split(message.message).each_slice(2).map(&:join)
    @transformed_message = message_transform(split_message)
  end


  # c = Encrypt.new('message', 'keyword')
  # d = c.message_encryption(c.split_message)
  # d = c.message.message_split(a).each_slice(2).map(&:join)
  def message_transform(split_message)
    transformed_message = ""
    pair_counter = 0
    message_size = split_message.size
    while pair_counter < message_size do
      retrieve_pair(pair_counter)
      character_1 = retrieve_pair(pair_counter)[0]
      character_2 = retrieve_pair(pair_counter)[1]
      character_1_location = element_location(character_1)
      character_2_location = element_location(character_2)
      if element_same_row?(character_1, character_2)
        new_character_1 = locate_character(character_1_location[0], new_character_location(character_1_location[1]))
        new_character_2 = locate_character(character_2_location[0], new_character_location(character_2_location[1]))
      elsif element_same_column?(character_1, character_2)
        new_character_1 = locate_character(new_character_location(character_1_location[0]), character_1_location[1])
        new_character_2 = locate_character(new_character_location(character_2_location[0]), character_2_location[1])
      else
        new_character_1 = locate_character(character_1_location[0], character_2_location[1])
        new_character_2 = locate_character(character_2_location[0], character_1_location[1])
      end
      pair_counter += 1
      transformed_message += new_character_1 + new_character_2
    end
    transformed_message
  end



  def retrieve_pair(pair_counter)
    #refactored after PR
    split_message[pair_counter].split('')
  end

#Here, the value 4 represents the last element of the subarray
#if the value passed from the encription to locate the character is higher than 4,
#as per the instructions of the playfair-cipher,
#the first element of the subarray is selected [0].

  def locate_character(row,column)
      row = 0  if row > ARRAY_SIZE - 1

      row = 4 if row < 0

      column = 0 if column > ARRAY_SIZE - 1

      column = 4 if column < 0

      board[row][column]
  end

#as instructed in the code review, I used the .nil? method as .present? is a rails method
  def element_location(element)
      board.each_with_index do |subarray, i|
        j = subarray.index(element)
        return i,j if j.nil? == false
    end
  end

#refactored after PR
  def element_same_row?(character_1, character_2)
    matching_character_location_on_index?(character_1, character_2, 0)
  end

  def element_same_column?(character_1, character_2)
    matching_character_location_on_index?(character_1, character_2, 1)
  end

  private

  def matching_character_location_on_index?(character_1,character_2,index)
    character_1_location = element_location(character_1)
    character_2_location = element_location(character_2)
    character_1_location[index] == character_2_location[index]
  end
end
