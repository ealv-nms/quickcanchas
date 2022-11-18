# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResenasController, type: :controller do
  include AuthHelper
  before(:each) do
    login_user
  end

  describe 'GET #index' do
    let(:reclamo) { create(:reclamo) }

    it 'returns http success' do
      get :index, params: { reclamo_id: reclamo.id }
      expect(response).to have_http_status(:success)
    end
  end
end
