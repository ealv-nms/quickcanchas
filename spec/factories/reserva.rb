# frozen_string_literal: true

FactoryBot.define do
  factory :reserva do
    usuario { 'F4Pepe' }
    horario { 8 }
    id_cancha { 1 }
    estado { 'Super' }
    cancha { FactoryBot.create(:cancha) }
    # user { FactoryBot.create(:user) }
  end
end
