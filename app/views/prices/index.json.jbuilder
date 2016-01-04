json.array!(@prices) do |price|
  json.extract! price, :id, :price_per_unit, :price_list_id, :product_id
  json.url price_url(price, format: :json)
end
