# frozen_string_literal: true

ActiveAdmin.register Cancha do
  index do
    selectable_column
    column :id
    column :tipo
    column :precio
    column :descripcion
    actions
  end

  permit_params :id, :tipo, :precio, :descripcion
end
