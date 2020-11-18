# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.float :quantity
      t.string :name
      t.text :description
      t.belongs_to :company

      t.timestamps
    end
  end
end
