json.array!(@price_lists) do |price_list|
  json.extract! price_list, :id, :EffectiveDate, :supplier_id
  json.url price_list_url(price_list, format: :json)
end
