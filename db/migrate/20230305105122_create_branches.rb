class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.references :company, foreign_key: true
      t.string :name #支店名
      t.string :tel #電話番号
      t.string :address #住所
      t.timestamps
    end
  end
end
