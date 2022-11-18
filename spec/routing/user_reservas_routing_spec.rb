# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserReservasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/user_reservas').to route_to('user_reservas#index')
    end

    it 'routes to #new' do
      expect(get: '/user_reservas/new').to route_to('user_reservas#new')
    end

    it 'routes to #show' do
      expect(get: '/user_reservas/1').to route_to('user_reservas#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/user_reservas/1/edit').to route_to('user_reservas#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/user_reservas').to route_to('user_reservas#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/user_reservas/1').to route_to('user_reservas#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/user_reservas/1').to route_to('user_reservas#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/user_reservas/1').to route_to('user_reservas#destroy', id: '1')
    end
  end
end
