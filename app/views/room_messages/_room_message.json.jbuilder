json.extract! room_message, :id, :room_id, :user_id, :message, :created_at, :updated_at
json.url room_message_url(room_message, format: :json)
