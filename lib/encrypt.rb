require_relative 'base'

class Encrypt < Base

  def new_character_location(character_location)
    character_location + 1
  end


#added function for testing purposes
  def display_transformed_message(transformed_message)
    transformed_message
  end
end
