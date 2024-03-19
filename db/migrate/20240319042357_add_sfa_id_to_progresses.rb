class AddSfaIdToProgresses < ActiveRecord::Migration[5.2]
  def change
    add_column :progresses, :sfa_id, :integer
  end
end
