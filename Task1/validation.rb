require 'date'
module Validation
  module_function

  def valid_name?(string)
    return false if string.length > 40 || string.empty?

    name_regex = /^(?=.{2,30}$)(\p{Lu}\p{Ll}+(?:-\p{Lu}\p{Ll}*)*)$/
    !!(string =~ name_regex)
  end

  def valid_inn?(string)
    inn_regex = /^[A-Z]{2}\d{10}$/
    !!(string =~ inn_regex)
  end

  def valid_date?(date)
    date < Date.today
  end
end
