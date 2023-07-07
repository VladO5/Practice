require 'test/unit'
require_relative "../Task2/Person"

class Person_test < Test::Unit::TestCase

  def setup
    @person = Person.new("Vlad","Osyp","VD1231231234",Date.today.prev_day)
  end



end