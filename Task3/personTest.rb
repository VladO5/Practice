require 'test/unit'
require_relative '../Task2/person'

class Person_test < Test::Unit::TestCase
  def setup
    @person = Person.new("Vlad", "Smith", "VD0123456789", Date.today.prev_day)
  end

  ['Anna', 'Анна', 'Anna-Ann', 'Anna-Maria', 'Анна-Марія', 'Ann', 'Анн', 'Anna-A', 'Анна-А'].each do |first_name|
    define_method("test_valid_first_name_#{first_name}") do
      @person.first_name = first_name
      assert_equal(first_name, @person.first_name, "First name #{first_name} is a valid")
    end
  end

  ['A', 'a', 'A-', '-A', '', ' ', '-', 'A-M', 'A-m', 'a-M', 'a-m', 'Л', 'Л-П', 'л-П', 'л-п', '1111'].each do |first_name|
    define_method("test_invalid_first_name_#{first_name}") do
      assert_raise { @person.first_name = first_name }
    end
  end

  ['Anna', 'Анна', 'Anna-Ann', 'Anna-Maria', 'Анна-Марія', 'Ann', 'Анн', 'Anna-A'].each do |last_name|
    define_method("test_valid_last_name_#{last_name}") do
      @person.last_name = last_name
      assert_equal(last_name, @person.last_name, "Last name #{last_name} is a valid")
    end
  end

  ['A', 'a', 'A-', '-A', '', ' ', '-', 'A-M', 'A-m', 'a-M', 'a-m', 'Л', 'Л-П', 'л-П', 'л-п', '1111'].each do |last_name|
    define_method("test_invalid_last_name_#{last_name}") do
      assert_raise { @person.last_name = last_name }
    end
  end

  ['AX1234567890', 'GF0987654321', 'EF2354678124', 'BV1789034561', 'VC1298356790'].each do |inn|
    define_method("test_valid_inn_#{inn}") do
      @person.inn = inn
      assert_equal(inn, @person.inn, "INN #{inn} is valid")
    end
  end

  ['Az1234567890', 'zF0987654321', 'ef2354678124', 'BV1789034', 'VC12983567904545', 'ASASDASDSASDA', '343434', '-', ' ', ''].each do |inn|
    define_method("test_invalid_inn_#{inn}") do
      assert_raise { @person.inn = inn }
    end
  end

  ['2000-11-12', '1995-09-23', '1800-12-21'].each do |birth_date|
    define_method("test_valid_birth_date_#{birth_date}") do
      @person.birth_date = birth_date
      assert_equal(Date.parse(birth_date), @person.birth_date, "Birth date #{birth_date} is valid")
    end
  end

  ['2223-11-12', '2058-34-32', ' ', '-', 2054-11-01].each do |birth_date|
    define_method("test_invalid_birth_date_#{birth_date}") do
      assert_raise { @person.birth_date = birth_date }
    end
  end
end