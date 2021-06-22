class PhoneNumber < ApplicationRecord
  belongs_to :branch_office
  validates :phone_number, :uniqueness => true, :presence => true
  paginates_per  6
end
