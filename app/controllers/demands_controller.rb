# frozen_string_literal: true

class DemandsController < ApplicationController
  def index
    @table_ids = Demand.all.map(&:table_id).uniq
  end

  def delete_all
    Demand.destroy_all
    redirect_to demands_path, notice: 'Pedidos deletados.'
  end
end