class FinalisingsController < ApplicationController
  before_action :set_coop
  before_action :set_finalising, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, only: [:edit, :update, :destroy]  
  before_action :check_rights, only: [:new, :edit, :update, :destroy]

  # GET /finalisings
  # GET /finalisings.json
  def index
    @finalisings = Finalising.all
  end

  # GET /finalisings/1
  # GET /finalisings/1.json
  def show
  end

  # GET /finalisings/new
  def new
    @finalising = @coop.finalisings.new
  end

  # GET /finalisings/1/edit
  def edit
  end

  # POST /finalisings
  # POST /finalisings.json
  def create
    @finalising = Finalising.new(finalising_params)

    respond_to do |format|
      if @finalising.save
        format.html { redirect_to coop_finalisings_path(@coop), notice: 'Finalising  date was successfully created.' }
        format.json { render :show, status: :created, location: @finalising }
      else
        format.html { render :new }
        format.json { render json: @finalising.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finalisings/1
  # PATCH/PUT /finalisings/1.json
  def update
    respond_to do |format|
      if @finalising.update(finalising_params)
        format.html { redirect_to coop_finalisings_path(@coop), notice: 'Finalising date  was successfully updated.' }
        format.json { render :show, status: :ok, location: @finalising }
      else
        format.html { render :edit }
        format.json { render json: @finalising.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finalisings/1
  # DELETE /finalisings/1.json
  def destroy
    @finalising.destroy
    respond_to do |format|
      format.html { redirect_to coop_finalisings_path(@coop), notice: 'Finalising date  was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finalising
      @finalising = Finalising.find(params[:id])
    end

    def set_coop
      @coop = Coop.find(params[:coop_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def finalising_params
      params.require(:finalising).permit(:final_date, :coop_id)
    end
end
