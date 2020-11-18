# frozen_string_literal: true

class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.belongs_to :table
      t.belongs_to :product
      t.belongs_to :company
      t.integer :product_quantity
      t.timestamps
    end
  end
end
