# frozen_string_literal: true

class CreateReservas < ActiveRecord::Migration[6.0]
  def change
    create_table :reservas do |t|
      t.string :usuario
      t.date :fecha_reserva
      t.integer :horario
      t.integer :id_cancha
      t.datetime :fecha_request
      t.string :estado
      t.datetime :fecha_respuesta

      t.timestamps
    end
  end
end
