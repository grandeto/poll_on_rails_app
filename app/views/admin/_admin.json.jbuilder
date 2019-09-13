json.extract! poll, :id, :name, :created_at, :updated_at
json.url admin_url(poll, format: :json)
