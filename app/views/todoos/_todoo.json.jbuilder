json.extract! todoo, :id, :name, :time, :priority, :created_at, :updated_at
json.url todoo_url(todoo, format: :json)