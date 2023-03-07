class CreateDeaths < ActiveRecord::Migration[5.2]
  def change
    create_table :deaths do |t|
      t.references :company, foreign_key: true
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
