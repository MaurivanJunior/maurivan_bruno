# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      def all_products
        @company = Company.find(params[:id])
        @table = Table.find(params[:table_id])
        if @company.present?
          hash = { "table_number": @table.table_number.to_s }
          hash[:products] = @company.products
          render status: :ok, json: hash
        else
          render status: :bad_request, json: {}
        end
      rescue ActiveRecord::RecordNotFound
        render status: :bad_request, json: {}
      end
    end
  end
end
