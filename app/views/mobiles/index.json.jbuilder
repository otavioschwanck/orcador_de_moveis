json.array!(@mobiles) do |mobile|
  json.extract! mobile, :id, :name, :description, :budget_id
  json.url mobile_url(mobile, format: :json)
end
