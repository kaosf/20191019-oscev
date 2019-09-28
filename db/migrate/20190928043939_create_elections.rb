class CreateElections < ActiveRecord::Migration[6.0]
  def change
    create_table :elections do |t|
      t.decimal :l, null: false
      t.decimal :m, null: false
      t.decimal :a, null: false
      t.decimal :b, null: false

      t.timestamps
    end
  end
end
