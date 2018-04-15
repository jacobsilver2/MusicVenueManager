class RemoveForeignKeyFromShows < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :shows, column: :act_id
  end
end
