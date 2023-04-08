class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :contact, :string
  end
end
