require_relative 'person'

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
        person.first_name.include?(part_of_name) || person.last_name.include?(part_of_name)
      end
    end

    def all
      @people
    end

    def edit(inn, updated_person)
      person_to_edit = by_inn(inn)

      if person_to_edit.nil?
        raise "Person not found"
      end

      person_to_edit.first_name = updated_person.first_name
      person_to_edit.last_name = updated_person.last_name
      person_to_edit.inn = updated_person.inn
      person_to_edit.birth_date = updated_person.birth_date
    end

    def delete(person)

      person_to_remove = by_inn(person.inn)

      if person_to_remove.nil?
        raise "Person not found"
      end

      @people.delete(person_to_remove)
    end

    def date_range(start_date, end_date)
      @people.select do |person|
        birth_date = person.birth_date
        (start_date.nil? || birth_date >= start_date) &&
          (end_date.nil? || birth_date <= end_date)
      end
    end
  end
