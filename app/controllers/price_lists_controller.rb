class PriceListsController < ApplicationController
  before_action :set_supplier
  before_action :set_price_list, only: [:show, :edit, :update, :destroy]

  # GET /price_lists
  # GET /price_lists.json
  def index
    @price_lists = PriceList.all
  end

  # GET /price_lists/1
  # GET /price_lists/1.json
  def show
  end

  # GET /price_lists/new
  def new    
    p @supplier
    @price_list = @supplier.price_lists.new
  end

  # GET /price_lists/1/edit
  def edit
  end

  # POST /price_lists
  # POST /price_lists.json
  def create
    @price_list = @supplier.price_lists.new(price_list_params)

    respond_to do |format|
      if @price_list.save
        format.html { redirect_to [@supplier,@price_list], notice: 'Price list was successfully created.' }
        format.json { render :show, status: :created, location: @price_list }
      else
        format.html { render :new }
        format.json { render json: @price_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_lists/1
  # PATCH/PUT /price_lists/1.json
  def update
    respond_to do |format|
      if @price_list.update(price_list_params)
        format.html { redirect_to @price_list, notice: 'Price list was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_list }
      else
        format.html { render :edit }
        format.json { render json: @price_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_lists/1
  # DELETE /price_lists/1.json
  def destroy
    @price_list.destroy
    respond_to do |format|
      format.html { redirect_to price_lists_url, notice: 'Price list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:supplier_id])
      puts 'here'
      puts @supplier
    end
    def set_price_list
      @price_list = @supplier.price_lists.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def price_list_params
      params.require(:price_list).permit(:EffectiveDate, :supplier_id)
    end
end
