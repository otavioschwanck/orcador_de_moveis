json.array!(@budgets) do |budget|
  json.extract! budget, :id, :description, :client_id
  json.url budget_url(budget, format: :json)
end
