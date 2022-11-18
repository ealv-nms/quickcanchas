# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(FactoryBot.create(:room_message)).to be_valid
    end
  end
end
