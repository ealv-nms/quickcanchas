# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reclamo, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:reclamo)).to be_valid
    end
  end
end
