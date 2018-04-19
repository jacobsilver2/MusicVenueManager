class AddColumnToActs < ActiveRecord::Migration[5.1]
  def change
    add_column :acts, :collectionName, :string
  end
end
