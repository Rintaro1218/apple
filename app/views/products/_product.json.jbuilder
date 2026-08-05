json.extract! product, :id, :name, :quantity, :category, :created_at, :updated_at
json.url product_url(product, format: :json)
