class AddOnDelete < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :reservas, :users
    add_foreign_key :reservas, :users, on_delete: :cascade
    remove_foreign_key :room_messages, :users
    add_foreign_key :room_messages, :users, on_delete: :cascade
    remove_foreign_key :user_reservas, :users
    add_foreign_key :user_reservas, :users, on_delete: :cascade
    remove_foreign_key :user_reservas, :reservas
    add_foreign_key :user_reservas, :reservas, on_delete: :cascade
    remove_foreign_key :rooms, :reservas
    add_foreign_key :rooms, :reservas, on_delete: :cascade
  end
end
