class AddActIdToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :act_id, :integer
  end
end
