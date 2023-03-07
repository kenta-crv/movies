class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.references :company, foreign_key: true
      t.date :year
      t.string :body
      t.timestamps
    end
  end
end
