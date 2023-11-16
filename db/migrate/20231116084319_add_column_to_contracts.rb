class AddColumnToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :memo, :string
  end
end
