class Product < ApplicationRecord
  belongs_to :branch_office
  belongs_to :category
  has_many :price_registers
  has_many :sales
  
  validates :product_name, :presence => true
  paginates_per  6
end
