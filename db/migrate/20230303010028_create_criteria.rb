class CreateCriteria < ActiveRecord::Migration[6.0]
  def change
    create_table :criteria do |t|
      t.integer :weight
      t.integer :decision_id
      t.string :name

      t.timestamps
    end
  end
end
