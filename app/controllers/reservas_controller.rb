# frozen_string_literal: true

# clase reservas
class ReservasController < ApplicationController
  before_action :authenticate_user!

  # GET /reservas or /reservas.json
  def index
    # if current_user.role != 0
    if params[:all] || current_user.is_mod
      @reservas = Reserva.all
    elsif params[:cancha_id]
      @cancha = Cancha.find(params[:cancha_id])
      @user = current_user
      @reservas_cancha = @cancha.reservas
      @reservas = []
      @reservas_cancha.each do |reserva|
        @reservas << reserva unless reserva.users.include?(@user)
      end
    else
      @user = current_user
      @reservas = @user.reservas
    end
  end

  # GET /reservas/1 or /reservas/1.json
  def show
    @reserva = Reserva.find(params[:id])
  end

  # GET /reservas/new
  def new
    @cancha = Cancha.find(params[:cancha_id])
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
    @reserva = Reserva.find(params[:id])
    @cancha = @reserva.cancha
    # @user = @reserva.user
  end

  # POST /reservas or /reservas.json
  def create
    @cancha = Cancha.find(params[:cancha_id])
    @reserva = Reserva.new(reserva_params)
    @reserva.user_id = current_user.id
    @reserva.usuario = current_user.id
    @reserva.id_cancha = @cancha.id
    @reserva.estado = 'Enviada'
    @reserva.cancha = @cancha
    @user = current_user
    @reserva.room = Room.create(reserva_id: @reserva.id)
    # @reserva.users << @user

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to cancha_path(@cancha), notice: 'Reserva was successfully created.' }
        format.json { render :show, status: :created, location: @reserva }
        @user.reservas << @reserva
      else
        format.html { redirect_to cancha_path(@cancha), notice: 'Esta reserva ya existe, intente unirse a ella' }
        format.json { render :show, status: :created, location: @reserva }
      end
    end
  end

  # PATCH/PUT /reservas/1 or /reservas/1.json
  def update
    @reserva = Reserva.find(params[:id])
    puts('---------------')
    puts(@reserva.estado)
    puts(@reserva.users)
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to reserva_url(@reserva), notice: 'Reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva }
        if @reserva.usuario == 'add'
          @user = current_user
          @user.reservas << @reserva
        end
        @reserva.usuario = 'no'
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_url, notice: 'Reserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reserva
    @reserva = Reserva.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reserva_params
    params.require(:reserva).permit(:usuario, :fecha_reserva, :horario, :id_cancha, :fecha_request, :estado,
                                    :fecha_respuesta)
  end
end
