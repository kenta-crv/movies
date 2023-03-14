class CreateExecutives < ActiveRecord::Migration[5.2]
  def change
    create_table :executives do |t|
      t.references :company, foreign_key: true
      t.string :position
      t.string :name
      t.timestamps
    end
  end
end
