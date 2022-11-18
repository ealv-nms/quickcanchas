json.extract! user_reserva, :id, :user_id, :reserva_id, :created_at, :updated_at
json.url user_reserva_url(user_reserva, format: :json)
