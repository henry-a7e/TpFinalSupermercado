class Rotation < ApplicationRecord
  belongs_to :branch_office
  belongs_to :department
  belongs_to :stall
  belongs_to :employee
 
  
  def jefe
    if head == true 
      "YES, head of stall"
    else
      "NO, head of stall"
    end
  end

  paginates_per  6
end
