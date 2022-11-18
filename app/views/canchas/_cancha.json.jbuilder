# frozen_string_literal: true

json.extract! cancha, :id, :id_cancha, :tipo, :precio, :descripcion, :created_at, :updated_at
json.url cancha_url(cancha, format: :json)
