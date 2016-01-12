json.array!(@finalisings) do |finalising|
  json.extract! finalising, :id, :final_date, :coop_id
  json.url finalising_url(finalising, format: :json)
end
