json.array!(@plates) do |plate|
  json.extract! plate, :id, :width, :height, :plate_value, :qtd, :mobile_id
  json.url plate_url(plate, format: :json)
end
