class AddColorToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :color, :string
  end
end