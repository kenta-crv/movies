class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :prefecture
      t.string :city
      t.string :birth
      t.string :gender
      t.string :age
      t.string :hire_date_1
      t.string :retirement_date_1
      t.string :content_1
      t.string :hire_date_2
      t.string :retirement_date_2
      t.string :content_2
      t.string :hire_date_3
      t.string :retirement_date_3
      t.string :content_3
      t.string :requirements
      t.string :appeal
      t.string :desired
      t.string :remarks
      t.timestamps
    end
  end
end
