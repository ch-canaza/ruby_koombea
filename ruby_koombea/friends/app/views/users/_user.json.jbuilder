json.extract! user, :id, :frirst_name, :last_name, :media, :created_at, :updated_at
json.url user_url(user, format: :json)
