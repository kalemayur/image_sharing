json.extract! album, :id, :album_name, :user_id, :created_at, :updated_at
json.url album_url(album, format: :json)
