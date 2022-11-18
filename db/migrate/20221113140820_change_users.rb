class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :nacimiento
    add_column :users, :nacimiento, :date
  end
end
