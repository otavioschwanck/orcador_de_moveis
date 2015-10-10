json.array!(@budget_items) do |budget_item|
  json.extract! budget_item, :id, :item_id, :qtd, :multiplicable, :mobile_id
  json.url budget_item_url(budget_item, format: :json)
end
