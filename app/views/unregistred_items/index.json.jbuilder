json.array!(@unregistred_items) do |unregistred_item|
  json.extract! unregistred_item, :id, :description, :value, :qtd, :mobile_id
  json.url unregistred_item_url(unregistred_item, format: :json)
end
