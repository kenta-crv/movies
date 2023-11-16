class ChangeNextToDateTimeInProgresses < ActiveRecord::Migration[5.2]
  def change
    change_column :progresses, :next, :datetime
  end
end