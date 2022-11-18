json.extract! reclamo, :id, :user_id, :titulo, :contenido, :created_at, :updated_at
json.url reclamo_url(reclamo, format: :json)
