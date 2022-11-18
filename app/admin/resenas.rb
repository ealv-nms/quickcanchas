# frozen_string_literal: true

ActiveAdmin.register Resena do
  filter :user
  filter :cancha_tipo, as: String
  filter :puntaje

  index do
    selectable_column
    column :users
    column(:cancha) { |c| c.cancha.tipo }
    column :puntaje
    column :comentario
    actions
  end

  permit_params :user, :puntaje, :comentario

  form do |f|
    f.inputs  do
      f.input :user
      f.input :puntaje
      f.input :comentario
      actions
    end
  end
end
