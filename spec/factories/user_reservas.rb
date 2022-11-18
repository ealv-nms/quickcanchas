# frozen_string_literal: true

FactoryBot.define do
  factory :user_reserva do
    user { FactoryBot.create(:user) }
    reserva { FactoryBot.create(:reserva) }
  end
end
