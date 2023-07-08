require_relative 'consoleInput'
require_relative '../Task1/validation'

class Person
  include Validation
  extend ConsoleInput

  attr_accessor :first_name, :last_name, :inn, :birth_date

  def initialize(first_name, last_name, inn, birth_date)
    @first_name = first_name
    @last_name = last_name
    @inn = inn
    @birth_date = birth_date
  end

  def first_name=(new_first_name)
    if valid_name?(new_first_name)
      @first_name = new_first_name
    else
      raise ArgumentError, "Invalid first name."
    end
  end

  def last_name=(new_last_name)
    if valid_name?(new_last_name)
      @last_name = new_last_name
    else
      raise ArgumentError, "Invalid last name."
    end
  end

  def inn=(new_inn)
    if valid_inn?(new_inn)
      @inn = new_inn
    else
      raise ArgumentError, "Invalid INN."
    end
  end

  def birth_date=(new_birth_date)
    birth_date = Date.parse(new_birth_date)
    if valid_date?(birth_date)
      @birth_date = birth_date
    else
      raise ArgumentError, "Invalid birth date."
    end
  end
end
