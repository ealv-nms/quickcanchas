# frozen_string_literal: true

class AddModeratorBoolean < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_mod, :boolean, default: false, null: false
  end
end
