class AddColumnElectionsB < ActiveRecord::Migration[6.0]
  def change
    add_column :elections, :b, :decimal, null: false, default: 100
  end
end
