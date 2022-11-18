# frozen_string_literal: true

class AddBirthdateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nacimiento, :datetime
  end
end
