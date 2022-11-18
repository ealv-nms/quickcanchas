# frozen_string_literal: true

class ReclamosController < ApplicationController
  before_action :set_reclamo, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /reclamos or /reclamos.json
  def index
    if params[:all] || current_user.is_mod
      @reclamos = Reclamo.all
    else
      @user = current_user
      @reclamos = @user.reclamos
    end
  end

  # GET /reclamos/1 or /reclamos/1.json
  def show
    @reclamo = Reclamo.find(params[:id])
  end

  # GET /reclamos/new
  def new
    @reclamo = Reclamo.new
  end

  # GET /reclamos/1/edit
  def edit
    @reclamo = Reclamo.find(params[:id])
    @user = @reclamo.user
  end

  # POST /reclamos or /reclamos.json
  def create
    @reclamo = Reclamo.new(reclamo_params)
    @reclamo.user_id = current_user.id

    respond_to do |format|
      if @reclamo.save
        format.html { redirect_to reclamo_url(@reclamo), notice: 'Reclamo was successfully created.' }
        format.json { render :show, status: :created, location: @reclamo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reclamos/1 or /reclamos/1.json
  def update
    @reclamo = Reclamo.find(params[:id])
    respond_to do |format|
      if @reclamo.update(reclamo_params)
        format.html { redirect_to reclamo_url(@reclamo), notice: 'Reclamo was successfully updated.' }
        format.json { render :show, status: :ok, location: @reclamo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reclamos/1 or /reclamos/1.json
  def destroy
    @reclamo = Reclamo.find(params[:id])
    @reclamo.destroy

    respond_to do |format|
      format.html { redirect_to reclamos_url, notice: 'Reclamo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reclamo
    @reclamo = Reclamo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reclamo_params
    params.require(:reclamo).permit(:user_id, :titulo, :contenido)
  end
end
