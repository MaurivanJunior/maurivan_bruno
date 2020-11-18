# frozen_string_literal: true

class TablesController < ApplicationController
  before_action :set_table, only: %i[show edit update destroy]
  require 'rqrcode'
  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.order(:table_number).page(params[:page]).per(10)
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
    url = "#{request.base_url}/api/v1/company/#{@table.company.id}/table/#{@table.id}/all_products"

    qrcode = RQRCode::QRCode.new(url)
    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit; end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Mesa criada com sucesso.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Mesa atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Mesa deletada.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_table
    @table = Table.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def table_params
    params.require(:table).permit(:table_number, :company_id)
  end
end
