class BranchOffice < ApplicationRecord
    has_many :phone_numbers
    has_many :rotations
    has_many :products
    
    validates :address, :uniqueness => true, :presence => true
    paginates_per  6
end
