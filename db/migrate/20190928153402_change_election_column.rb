class ChangeElectionColumn < ActiveRecord::Migration[6.0]
  def change
    drop_table :votes
    drop_table :candidates
    drop_table :elections

    create_table :elections do |t|
      t.decimal :l, null: false
      t.decimal :m, null: false
      t.decimal :g, null: false
      t.decimal :n, null: false
      t.decimal :n_sq, null: false

      t.timestamps
    end

    create_table :candidates do |t|
      t.references :election, null: false, foreign_key: true
      t.integer :number, null: false
      t.string :name, null: false

      t.timestamps
    end

    create_table :votes do |t|
      t.references :election, null: false, foreign_key: true
      t.decimal :m, null: false
      t.decimal :r, null: false

      t.timestamps
    end
  end
end
