# frozen_string_literal: true

class Demand < ApplicationRecord
  belongs_to :table
  belongs_to :product
  belongs_to :company
end
