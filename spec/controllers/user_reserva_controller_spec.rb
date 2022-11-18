# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReservasController, type: :controller do
  include AuthHelper
  before(:each) do
    login_user
  end

  describe 'GET #index' do
    let(:reserva) { create(:reserva) }

    it 'returns http success' do
      get :index, params: { reserva_id: reserva.id }
      expect(response).to have_http_status(:success)
    end
  end
end
