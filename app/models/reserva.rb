# frozen_string_literal: true

class Reserva < ApplicationRecord
  # attr_reader :fecha_reserva
  validates :id_cancha, numericality: { only_integer: true, greater_than: 0 }
  validates :horario, numericality: { only_integer: true, in: 0..5 }
  validates :fecha_reserva, uniqueness: { scope: %i[horario id_cancha] }
  has_many :user_reservas
  has_many :users, through: :user_reservas, dependent: :delete_all
  has_one :room, dependent: :destroy
  belongs_to :cancha

  def is_accepted
    estado == 'Aceptado'
  end
end
