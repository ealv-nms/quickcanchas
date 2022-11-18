# frozen_string_literal: true

class UpdateModRole < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :is_mod
    add_column :users, :role, :int, default: 0, null: false
  end
end
