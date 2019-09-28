class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :election, null: false, foreign_key: true
      t.decimal :m
      t.decimal :r

      t.timestamps
    end
  end
end
