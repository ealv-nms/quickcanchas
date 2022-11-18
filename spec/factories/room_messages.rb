# frozen_string_literal: true

FactoryBot.define do
  factory :room_message do
    room { FactoryBot.create(:room) }
    user { FactoryBot.create(:user) }
    message { 'MyText' }
  end
end
