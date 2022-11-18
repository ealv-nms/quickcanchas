# frozen_string_literal: true

# controladores resenas
class ResenasController < ApplicationController
  before_action :set_resena, only: %i[show edit update destroy]
  # before_action :authenticate_user!
  # GET /resenas or /resenas.json
  def index
    if params[:all]
      @resenas = Resena.all
    else
      @user = current_user
      @resenas = @user.resenas
    end
  end

  # GET /resenas/1 or /resenas/1.json
  def show; end

  # GET /resenas/new
  def new
    authenticate_user!
    @cancha = Cancha.find(params[:cancha_id])
    @resena = Resena.new
  end

  # GET /resenas/1/edit
  def edit
    authenticate_user!
    @resena = Resena.find(params[:id])
    @cancha = @resena.cancha
  end

  # POST /resenas or /resenas.json
  def create
    @cancha = Cancha.find(params[:cancha_id])
    @resena = Resena.new(resena_params)
    @resena.user_id = current_user.id
    @resena.cancha_id = @cancha.id
    @resena.cancha = @cancha
    respond_to do |format|
      if @resena.save
        format.html { redirect_to cancha_url(@cancha), notice: 'Resena was successfully created.' }
        format.json { render :show, status: :created, location: @resena }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resena.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resenas/1 or /resenas/1.json
  def update
    respond_to do |format|
      if @resena.update(resena_params)
        format.html { redirect_to resena_url(@resena), notice: 'Resena was successfully updated.' }
        format.json { render :show, status: :ok, location: @resena }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resena.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resenas/1 or /resenas/1.json
  def destroy
    authenticate_user!
    @resena = Resena.find(params[:id])
    @resena.destroy

    respond_to do |format|
      format.html { redirect_to resenas_url, notice: 'Resena was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resena
    @resena = Resena.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def resena_params
    params.require(:resena).permit(:user_id, :cancha_id, :puntaje, :comentario)
  end
end
