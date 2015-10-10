json.array!(@drawers) do |drawer|
  json.extract! drawer, :id, :description, :width, :height, :front_plate, :internal, :slide, :qtd, :mobile_id
  json.url drawer_url(drawer, format: :json)
end
