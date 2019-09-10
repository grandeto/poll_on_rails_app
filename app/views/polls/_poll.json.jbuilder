json.extract! poll, :id, :name, :created_at, :updated_at
json.url poll_url(poll, format: :json)
