class CreatePresidents < ActiveRecord::Migration[5.2]
  def change
    create_table :presidents do |t|
      t.references :company, foreign_key: true
      t.string :face
      t.string :body
      t.timestamps
    end
  end
end
