# frozen_string_literal: true

class Table < ApplicationRecord
  require 'rqrcode'

  belongs_to :company
  has_many :demands, dependent: :destroy
  has_many :products, through: :demands

  validates :table_number, presence: true
  validates :company_id, presence: true
  validates :table_number, uniqueness: { scope: :company_id,
                                         message: 'Não pode haver duas ou mais Mesas com o mesmo Número no Bar' }
end
