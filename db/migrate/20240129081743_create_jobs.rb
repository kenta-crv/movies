class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :tel
      t.string :email
      t.string :birth
      t.string :gender
      t.string :city
      t.string :qualification
      t.string :period

      t.string :work_history
      t.string :situation

      t.string :area_hope
      t.string :course_hope

      t.string :quality_rank

      t.string :contact_tool
      t.string :interview

      t.string :remarks
      t.timestamps
    end
  end
end
