json.extract! flight, :id, :name, :flight_class, :manufacturer, :source, :destination, :capacity, :cost, :created_at, :updated_at
json.url flight_url(flight, format: :json)
