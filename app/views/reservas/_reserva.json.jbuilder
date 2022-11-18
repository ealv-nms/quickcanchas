# frozen_string_literal: true

json.extract! reserva, :id, :usuario, :fecha_reserva, :horario, :id_cancha, :fecha_request, :estado, :fecha_respuesta,
              :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
