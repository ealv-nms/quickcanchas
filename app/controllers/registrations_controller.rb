# frozen_string_literal: true

# controladores registros
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(
      :email,
      :name,
      :nacimiento,
      :phone,
      :password,
      :password_confirmation
    )
  end

  def account_update_params
    params.require(:user).permit(
      :email,
      :name,
      :nacimiento,
      :phone,
      :password,
      :password_confirmation,
      :current_password
    )
  end
end
