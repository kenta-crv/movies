class CreateSfas < ActiveRecord::Migration[5.2]
  def change
    create_table :sfas do |t|

      t.timestamps
    end
  end
end
