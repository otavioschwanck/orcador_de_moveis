json.array!(@clients) do |client|
  json.extract! client, :id, :name, :phone, :cell_phone, :email, :description, :user_id
  json.url client_url(client, format: :json)
end
