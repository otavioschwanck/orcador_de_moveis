json.array!(@items) do |item|
  json.extract! item, :id, :name, :value, :description, :who_sell, :user_id
  json.url item_url(item, format: :json)
end
