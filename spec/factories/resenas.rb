# frozen_string_literal: true

FactoryBot.define do
  factory :resena do
    user { FactoryBot.create(:user) }
    cancha { FactoryBot.create(:cancha) }
    puntaje { 1 }
    comentario { 'MyText' }
  end
end
