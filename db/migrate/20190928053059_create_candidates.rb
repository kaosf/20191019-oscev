class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.references :election, null: false, foreign_key: true
      t.integer :number, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
