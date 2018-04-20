class AddColumnToActShows < ActiveRecord::Migration[5.1]
  def change
    add_column :act_shows, :set_order, :integer
  end
end
