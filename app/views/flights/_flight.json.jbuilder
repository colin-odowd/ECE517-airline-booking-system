json.extract! flight, :id, :name, :klass, :manufacturer, :source, :destination, :capacity, :status, :cost, :created_at, :updated_at
json.url flight_url(flight, format: :json)
