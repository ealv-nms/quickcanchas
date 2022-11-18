# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  # Esto para que no se pueda crear otro admin
  actions :all, except: [:new]

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

ActiveAdmin.setup do |config|
  config.comments = false
end

ActiveAdmin.setup do |config|
  config.namespace :admin do |admin|
    admin.build_menu :utility_navigation do |menu|
      menu.add label: 'Volver a la página', url: '/'
      admin.add_current_user_to_menu  menu
      admin.add_logout_button_to_menu menu
    end
  end
end
