# frozen_string_literal: true

FactoryBot.define do
  factory :reclamo do
    user { FactoryBot.create(:user) }
    titulo { 'MyString' }
    contenido { 'MyText' }
  end
end
