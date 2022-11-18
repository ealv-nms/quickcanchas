# frozen_string_literal: true

class Cancha < ApplicationRecord
  validates :tipo, :precio, :descripcion, presence: true
  validates :precio, numericality: { only_integer: true, greater_than: 0 }
  has_many :reservas
  has_many :resenas
end
