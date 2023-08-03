class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :year
      t.integer :sales

      t.timestamps
    end
  end
end
