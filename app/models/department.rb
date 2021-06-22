class Department < ApplicationRecord
    has_many :rotations

    validates :department_name, :uniqueness => true, :presence => true
    paginates_per  6
end
