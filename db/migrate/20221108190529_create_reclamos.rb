class CreateReclamos < ActiveRecord::Migration[6.0]
  def change
    create_table :reclamos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :titulo
      t.text :contenido

      t.timestamps
    end
  end
end
