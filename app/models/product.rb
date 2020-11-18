# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :company
  has_many :demands
  has_many :tables, through: :demands

  validates :name, presence: true
  validates :company_id, presence: true
  validates :quantity, presence: true
  validates :name, uniqueness: { scope: :company_id,
                                 message: 'Não pode haver dois ou mais Produtos com o mesmo nome no Bar' }
end
