# frozen_string_literal: true

class DemandsController < ApplicationController
  def index
    @table_ids = Demand.all.map(&:table_id).uniq
  end
end
