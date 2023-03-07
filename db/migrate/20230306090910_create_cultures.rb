class CreateCultures < ActiveRecord::Migration[5.2]
  def change
    create_table :cultures do |t|
      t.references :company, foreign_key: true
      t.string :body
      t.timestamps
    end
  end
end
