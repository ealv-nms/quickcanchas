# frozen_string_literal: true

json.extract! resena, :id, :user_id, :cancha_id, :puntaje, :comentario, :created_at, :updated_at
json.url resena_url(resena, format: :json)
