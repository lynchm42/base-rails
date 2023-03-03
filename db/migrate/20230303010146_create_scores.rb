class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :score
      t.integer :option_id
      t.integer :criteria_id

      t.timestamps
    end
  end
end
