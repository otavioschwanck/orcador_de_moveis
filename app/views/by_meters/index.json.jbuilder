json.array!(@by_meters) do |by_meter|
  json.extract! by_meter, :id, :width, :height, :meter_price, :qtd, :mobile_id
  json.url by_meter_url(by_meter, format: :json)
end
