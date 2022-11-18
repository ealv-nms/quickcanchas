# frozen_string_literal: true

class UserReserva < ApplicationRecord
  belongs_to :user
  belongs_to :reserva
end
