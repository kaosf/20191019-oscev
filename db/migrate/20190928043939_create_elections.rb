class CreateElections < ActiveRecord::Migration[6.0]
  def change
    create_table :elections do |t|
      t.decimal :l
      t.decimal :m
      t.decimal :a
      t.decimal :b

      t.timestamps
    end
  end
end
