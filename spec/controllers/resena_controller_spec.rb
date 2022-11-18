# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResenasController, type: :controller do
  include AuthHelper
  before(:each) do
    login_user
  end

  describe 'GET #index' do
    let(:cancha) { create(:cancha) }

    it 'returns http success' do
      get :index, params: { cancha_id: cancha.id }
      expect(response).to have_http_status(:success)
    end
  end
end
