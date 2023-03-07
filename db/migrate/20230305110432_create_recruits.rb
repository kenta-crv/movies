class CreateRecruits < ActiveRecord::Migration[5.2]
  def change
    create_table :recruits do |t|
      t.references :company, foreign_key: true
      t.date :year
      t.string :salary #給与
      t.string :occupation #募集職種
      t.string :employment_status #雇用形態
      t.string :body #求人内容
      t.string :sales_point #セールスポイント
      t.timestamps
    end
  end
end
