# frozen_string_literal: true

module Api
  module V1
    class DemandsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        @company = Company.find(params[:id]) # acha de que bar pertence a mesa

        data = params["_json"] # pega os dados vindos pela api
        @table = @company.tables.find_by(table_number: data.first[1].to_i) # acha a mesa que foi scaneada
        data.shift # deleta a mesa do array, deixando somente os produtos

        # percorre o array de produtos com suas quantidades e cria um Pedido
        data.each do |product|
          p = @company.products.find_by(name: product[0])

          Demand.create!(table_id: @table.id, product_id: p.id, company_id: @company.id, product_quantity: product[1])
        end

        render status: :ok, json: {status: 'Pedido enviado com sucesso!'}
      rescue ActiveRecord::RecordNotFound
        render status: :bad_request, json: {status: 'Houve um problema com seu pedido!'}
      end
    end
  end
end
