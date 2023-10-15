class AddColumnToContract < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :person_email, :string 
    add_column :contracts, :recruit_url_2, :string
    add_column :contracts, :pdf, :string
  end
end
