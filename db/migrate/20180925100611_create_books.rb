class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date :release_date
      t.decimal :base_price, precision: 8, scale: 2
      t.string :currency

      t.timestamps
    end
  end
end
