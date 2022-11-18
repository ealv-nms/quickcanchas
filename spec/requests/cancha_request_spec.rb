# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cancha, type: :request do
  before(:all) do
    @cancha = create(:cancha)
    @cancha.save
  end

  describe 'POST /canchas' do
    it 'should create a cancha' do
      expect do
        post canchas_path, params: {
          cancha: {
            tipo: @cancha.tipo,
            precio: @cancha.precio,
            descripcion: @cancha.descripcion
          }
        }
      end.to change(Cancha, :count).by(1)
    end

    it 'should not create a cancha with invalid data' do
      expect do
        post canchas_path, params: {
          cancha: {
            tipo: @cancha.tipo,
            precio: -1,
            descripcion: @cancha.descripcion
          }
        }
      end.to change(Cancha, :count).by(0)
    end
  end

  describe 'PATCH /canchas/:id' do
    it 'should update a cancha\'s precio' do
      patch cancha_path(@cancha), params: {
        cancha: {
          tipo: @cancha.tipo,
          precio: 2020,
          descripcion: @cancha.descripcion
        }
      }
      expect(Cancha.find(@cancha.id).precio).to eq(2020)
    end

    it 'should not update a cancha with invalid data' do
      patch cancha_path(@cancha), params: {
        cancha: {
          tipo: @cancha.tipo,
          precio: 2020,
          descripcion: ''
        }
      }
      expect(Cancha.find(@cancha.id).descripcion).to eq(@cancha.descripcion)
    end
  end

  describe 'DELETE /canchas/:id' do
    it 'should delete a cancha' do
      expect do
        delete cancha_path(@cancha)
      end.to change(Cancha, :count).by(-1)
    end
  end
end
