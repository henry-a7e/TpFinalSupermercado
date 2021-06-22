class Stall < ApplicationRecord
    has_many :rotations

    validates :stall_name, :uniqueness => true, :presence => true
    paginates_per  6
end
