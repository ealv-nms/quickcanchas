# frozen_string_literal: true

class UserReservasController < ApplicationController
  before_action :set_user_reserva, only: %i[show edit update destroy]

  # GET /user_reservas or /user_reservas.json
  def index
    @user_reservas = UserReserva.all
  end

  # GET /user_reservas/1 or /user_reservas/1.json
  def show; end

  # GET /user_reservas/new
  def new
    @user_reserva = UserReserva.new
  end

  # GET /user_reservas/1/edit
  def edit; end

  # POST /user_reservas or /user_reservas.json
  def create
    @user_reserva = UserReserva.new(user_reserva_params)

    respond_to do |format|
      if @user_reserva.save
        format.html { redirect_to user_reserva_url(@user_reserva), notice: 'User reserva was successfully created.' }
        format.json { render :show, status: :created, location: @user_reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_reservas/1 or /user_reservas/1.json
  def update
    respond_to do |format|
      if @user_reserva.update(user_reserva_params)
        format.html { redirect_to user_reserva_url(@user_reserva), notice: 'User reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_reservas/1 or /user_reservas/1.json
  def destroy
    @user_reserva.destroy

    respond_to do |format|
      format.html { redirect_to user_reservas_url, notice: 'User reserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_reserva
    @user_reserva = UserReserva.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_reserva_params
    params.require(:user_reserva).permit(:user_id, :reserva_id)
  end
end
