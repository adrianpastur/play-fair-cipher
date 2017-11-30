require_relative 'base'

class Decrypt < Base\

  def new_character_location(character_location)
    character_location - 1
  end


  def return_reformed_decrypted_message(transformed_message)
    transformed_message = transformed_message.split('')
    transformed_message.each_with_index do |x, index|
        previous_x = transformed_message[index - 1]
        next_x = transformed_message[index + 1]
      transformed_message.delete_at(index)  if previous_x == next_x && x == 'X'
    end
    transformed_message = transformed_message.join('')
  end
end
