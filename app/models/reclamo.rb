# frozen_string_literal: true

class Reclamo < ApplicationRecord
  belongs_to :user
  validates :titulo, :contenido, presence: true
  validates :contenido, length: { maximum: 500 }
end
