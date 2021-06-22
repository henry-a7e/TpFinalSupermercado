json.extract! product, :id, :product_name, :purchase_amount, :sale_amount, :stock, :branch_office_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
