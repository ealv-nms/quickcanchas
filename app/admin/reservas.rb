# frozen_string_literal: true

ActiveAdmin.register Reserva do
  filter :user
  filter :fecha_reserva
  filter :horario
  filter :estado

  index do
    selectable_column
    column :user
    column :fecha_reserva
    column :horario
    column :estado
    actions
  end

  permit_params :usuario, :fecha_reserva, :horario, :id_cancha, :estado, :user_id, :cancha_id

  form do |f|
    f.inputs  do
      f.input :users
      f.input :horario
      # f.input :estado
      f.input :estado, as: :select, selected: resource.estado,
                       collection: [%w[Enviada Enviada], %w[Rechazado Rechazado], %w[Aceptado Aceptado]]
      actions
    end
  end

  # ['Pendiente', 'Rechazado', 'Aceptado']
end
