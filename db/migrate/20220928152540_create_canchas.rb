# frozen_string_literal: true

class CreateCanchas < ActiveRecord::Migration[6.0]
  def change
    create_table :canchas do |t|
      t.integer :id_cancha
      t.string :tipo
      t.integer :precio
      t.string :descripcion

      t.timestamps
    end
  end
end
