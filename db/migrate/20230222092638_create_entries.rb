class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :occupation
      t.string :name
      t.string :tel
      t.string :email
      t.string :age
      t.string :experience
      t.string :number_of_years
      t.string :work_content
      t.string :acquired_language
      t.string :annual_income
      t.string :desired_salary
      t.string :desired_employment
      t.string :desired_work_location
      t.string :desired_period
      t.timestamps
    end
  end
end
