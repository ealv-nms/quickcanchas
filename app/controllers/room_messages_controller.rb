# frozen_string_literal: true

class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    head :ok
    RoomChannel.broadcast_to(@room, @room_message)
    puts '--------------------------------------------------El mensaje salió'
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
