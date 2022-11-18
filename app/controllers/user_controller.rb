# frozen_string_literal: true

# clase user
class UserController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
  end

  # GET /user/1/edit
  def edit
    @user = current_user
  end

  def destroy
    @user = User.find(params[:email])
    @user.destroy

    redirect_to root_url, notice: 'Usuario eliminado.' if @user.destroy
  end

  # def create_profile_pic
  #   @user = User.find(params[:profile_picture])
  # end

  def become_mod
    @user = User.find(params[:email])

    if @user.role == 1
      redirect_to root_url, notice: 'El usuario ya es moderador. No se han producido cambios'
    else
      redirect_to root_url, notice: 'Tu solicitud será revisada por el administrador.'
      @user.role = 2
      @user.save
    end
  end

  # PATCH/PUT /user/1 or /user/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end
