json.array!(@products) do |product|
  json.extract! product, :id, :product_code, :description, :unit, :qty_outer, :qty_min
  json.url product_url(product, format: :json)
end
