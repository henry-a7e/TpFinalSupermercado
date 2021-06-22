class Employee < ApplicationRecord
    has_many :rotations

    validates :document_number, :uniqueness => true, :presence => true
    validates :gender, :presence => true

    def full_name 
      first_name + " " + last_name
    end
    def sexo 
        if gender == 1
          "Masculino"
        else 
          "Femenino "
        end
    end

    paginates_per  6
end
