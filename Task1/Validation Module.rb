require 'date'
module Validation
  module_function

  def validate_name?(string)
    return false if string.length > 40 || string.empty?

    name_regex = /\A(?=.*[A-Z])[A-Za-z]+(?:-[A-Za-z]+)?\z/
    !!(string =~ name_regex)
  end

  def validate_surname?(string)
    return false if string.length > 40 || string.empty?

    surname_regex = /\A(?=.*[A-Z])[A-Za-z]+\z/
    !!(string =~ surname_regex)
  end

  def validate_inn?(string)
    inn_regex = /^[A-Z]{2}\d{10}$/
    !!(string =~ inn_regex)
  end

  def validate_date?(date)
    date < Date.today
  end
end
