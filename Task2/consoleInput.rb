require_relative "../Task1/validation.rb"

module ConsoleInput
  include Validation

  def get_string(prompt)
    loop do
      print prompt
      string = gets.chomp
      return string if string.is_a?(String) && !string.empty?

      puts "Invalid input. Please try again."
    end
  end

  def get_name(prompt)
    loop do
      print prompt
      name= gets.chomp
      return name if Validation.validate_name?(name)

      puts "Invalid Name. Please try again"
    end
  end

  def get_surname(prompt)
    loop do
      print prompt
      surname= gets.chomp
      return surname if Validation.validate_surname?(surname)

      puts "Invalid surname. Please try again"
    end
  end

  def get_inn(prompt)
    loop do
      print prompt
      inn= gets.chomp
      return inn if Validation.validate_inn?(inn)

      puts "Invalid INN. Please try again"
    end
  end

  def get_date(prompt)
    require 'date'

    loop do
      print prompt
      date_str = gets.chomp
        date = Date.parse(date_str)
        return date if Validation.validate_date?(date)

        puts "Invalid date. Please enter a date earlier than today."
    end
  end
end
