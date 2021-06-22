class Category < ApplicationRecord
    has_many :products

    validates :category_name, :uniqueness => true, :presence => true
    def categoriaPadre
        if id_category_father.nil?
            "No tiene categoria padre"
    
        end
    end
    paginates_per  6
end
