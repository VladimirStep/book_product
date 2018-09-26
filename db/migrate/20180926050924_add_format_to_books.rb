class AddFormatToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :format, :integer
  end
end
