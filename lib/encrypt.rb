require 'pry'
require_relative 'message'
require_relative 'key_table'

class Encrypt
  def initialize(message,table)
    @message = Message.new(message)
    @table = Table.new(table)
    initialize_components
  end
  attr_accessor :message, :table, :board, :split_message

  def initialize_components
    @board = table.fill_table(table.keyword)
    @split_message = message.message_split(message.message).each_slice(2).map(&:join)
  end

  def message_encription(split_message)
    pair_counter = 0
    encripted_message = ""
    message_size = split_message.size
    while pair_counter < message_size do
      retrieve_pair(pair_counter)
      character_1 = retrieve_pair(pair_counter)[0]
      character_2 = retrieve_pair(pair_counter)[1]
      if element_same_row(character_1, character_2)
        character_1_location = element_location(character_1)
        character_2_location = element_location(character_2)
        new_character_1 = locate_character(character_1_location[0], character_1_location[1] + 1)
        new_character_2 = locate_character(character_2_location[0], character_2_location[1] + 1)
        encripted_message += new_character_1 + new_character_2
        pair_counter += 1
      elsif element_same_column(character_1, character_2)
        character_1_location = element_location(character_1)
        character_2_location = element_location(character_2)
        new_character_1 = locate_character(character_1_location[0] + 1, character_1_location[1])
        new_character_2 = locate_character(character_2_location[0] + 1, character_2_location[1])
        encripted_message += new_character_1 + new_character_2
        pair_counter += 1
      else
        character_1_location = element_location(character_1)
        character_2_location = element_location(character_2)
        new_character_1 = locate_character(character_1_location[0], character_2_location[1])
        new_character_2 = locate_character(character_2_location[0], character_1_location[1])
        encripted_message += new_character_1 + new_character_2
        pair_counter += 1
      end
    end
    encripted_message
  end

  def retrieve_pair(pair_counter)
    a = split_message[pair_counter]
    b = a.split("")
    return b
  end

  def locate_character(row,column)
      row = 0 if row > 4
      column = 0 if column > 4
      board[row][column]
  end

  def element_location(element)
      board.each_with_index do |subarray, i|
      j = subarray.index(element)
      return i,j if j
    end
  end

  def element_same_row(character_1, character_2)
    character_1_location = element_location(character_1)
    character_2_location = element_location(character_2)
    if character_1_location[0] == character_2_location[0]
       true
    else
      false
    end
  end

  def element_same_column(character_1, character_2)
    character_1_location = element_location(character_1)
    character_2_location = element_location(character_2)
    if character_1_location[1] == character_2_location[1]
      true
    else
      false
    end
  end
end
