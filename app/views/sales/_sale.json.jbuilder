json.extract! sale, :id, :discount, :total_amount, :product_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
