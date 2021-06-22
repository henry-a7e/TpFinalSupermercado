class PriceRegister < ApplicationRecord
  belongs_to :product

  paginates_per  6
end
