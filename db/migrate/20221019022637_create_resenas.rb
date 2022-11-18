# frozen_string_literal: true

class CreateResenas < ActiveRecord::Migration[6.0]
  def change
    create_table :resenas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cancha, null: false, foreign_key: true
      t.integer :puntaje
      t.text :comentario

      t.timestamps
    end
  end
end
