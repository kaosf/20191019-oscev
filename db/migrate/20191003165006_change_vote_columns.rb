class ChangeVoteColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :r
    rename_column :votes, :m, :c
  end
end
