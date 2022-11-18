# frozen_string_literal: true

ActiveAdmin.register User do
  filter :email
  filter :name
  filter :nacimiento
  filter :role

  index do
    selectable_column
    column :email
    column :name
    column :nacimiento
    column :role
    actions
  end

  permit_params :email, :name, :nacimiento, :role

  form do |f|
    f.inputs :email, :name, :nacimiento, :role
    actions
  end
end
