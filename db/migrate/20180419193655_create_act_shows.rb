class CreateActShows < ActiveRecord::Migration[5.1]
  def change
    create_table :act_shows do |t|
      t.integer :act_id
      t.integer :show_id

      t.timestamps
    end
  end
end
