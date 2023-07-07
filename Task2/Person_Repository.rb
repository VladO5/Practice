require_relative 'Person'

class PersonRepository
    attr_accessor :people

    def initialize
      @people = []
    end

    def add(person)
      @people << person
    end

    def by_inn(inn)
      @people.find { |person| person.inn == inn }
    end

    def by_part_name(part_of_name)
      @people.select do |person|
        person.name.include?(part_of_name) || person.surname.include?(part_of_name)
      end
    end

    def all
      @people
    end

    def edit(inn, updated_person)
      person = ByInn(inn)
      return unless person

      person.name = updated_person.name if updated_person.name
      person.surname = updated_person.surname if updated_person.surname
      person.inn = updated_person.inn if updated_person.inn
      person.date_of_birth = updated_person.date_of_birth if updated_person.date_of_birth
    end

    def delete(inn)
      @people.delete_if { |person| person.inn == inn }
    end

    def date_range(start_date, end_date)
      @people.select do |person|
        date_of_birth = person.date_of_birth
        (start_date.nil? || date_of_birth >= start_date) &&
          (end_date.nil? || date_of_birth <= end_date)
      end
    end
  end
