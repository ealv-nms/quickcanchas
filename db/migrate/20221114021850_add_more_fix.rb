class AddMoreFix < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :reservas, :canchas
    add_foreign_key :reservas, :canchas, on_delete: :cascade
    remove_foreign_key :room_messages, :rooms
    add_foreign_key :room_messages, :rooms, on_delete: :cascade
    remove_foreign_key :reclamos, :users
    add_foreign_key :reclamos, :users, on_delete: :cascade
    remove_foreign_key :resenas, :canchas
    add_foreign_key :resenas, :canchas, on_delete: :cascade
    remove_foreign_key :resenas, :users
    add_foreign_key :resenas, :users, on_delete: :cascade
  end
end
