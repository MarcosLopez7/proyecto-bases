class AddCostoPorElementoToInventarios < ActiveRecord::Migration
  def change
    add_column :inventarios, :costo_por_elemento, :integer
  end
end
