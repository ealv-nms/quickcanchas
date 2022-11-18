# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    reserva { FactoryBot.create(:reserva) }
  end
end
