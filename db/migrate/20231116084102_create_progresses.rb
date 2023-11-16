class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.references :contract, foreign_key: true
      t.string :status
      t.datetime :next
      t.string :body
      t.timestamps
    end
  end
end
