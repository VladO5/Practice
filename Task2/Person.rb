require_relative 'ConsoleInput Module'
require_relative '../Task1/Validation Module'

class Person
  include Validation
  extend ConsoleInput

  attr_accessor :name, :surname, :inn, :date_of_birth

  def initialize(name, surname, inn, date_of_birth)
    self.name = name
    self.surname = surname
    self.inn = inn
    self.date_of_birth = date_of_birth
  end

  def name(name)
    if validate_name?(name)
      @name = name
    else
      puts "Invalid name"
    end

    name
  end

  def surname(surname)
    if validate_surname?(surname)
      @surname = surname
    else
      puts "Invalid surname"
    end

    surname
  end

  def inn(inn)
    if validate_inn?(inn)
      @inn = inn
    else
      puts "Invalid inn"
    end

    inn
  end

  def date_of_birth(date_of_birth)
    date = Date.parse(date_of_birth)

    if validate_date?(date)
      @date_of_birth = date
    else
      puts "Invalid date of birth"
    end
  end

  def to_s
    "Name: #{@name}, Surname: #{@surname}, INN: #{@inn}, Date Of Birth: #{@date_of_birth}"
  end

  def self.create_valid_person
    input_validate_name = get_string("Input Name:\n")
    input_validate_surname = get_string("Input Surname:\n")
    input_birth_date = get_date("Input Date of birth: \n")

    input_inn = nil

    loop do
      print "#{"Input INN"}\n"
      input_inn = gets.chomp

      if input_inn.is_a?(String) && !input_inn.empty?
        break
      end

      print "Invalid input. Please try again!"
    end

    return Person.new(input_validate_name, input_validate_surname, input_birth_date.to_s, input_inn)
  end
end
