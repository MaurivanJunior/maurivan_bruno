# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.integer :table_number
      t.belongs_to :company
      t.timestamps
    end
  end
end
