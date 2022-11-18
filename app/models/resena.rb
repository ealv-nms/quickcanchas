# frozen_string_literal: true

class Resena < ApplicationRecord
  belongs_to :user
  belongs_to :cancha

  validates :comentario, :puntaje, presence: true
  validates :comentario, length: { maximum: 500 }
  validates :puntaje, numericality: { only_integer: true, in: 0..5 }
end
