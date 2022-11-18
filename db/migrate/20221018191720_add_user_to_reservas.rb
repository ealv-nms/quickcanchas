# frozen_string_literal: true

class AddUserToReservas < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservas, :user, foreign_key: true
    add_reference :reservas, :cancha, foreign_key: true
  end
end
