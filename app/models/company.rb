# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :tables, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :demands, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
