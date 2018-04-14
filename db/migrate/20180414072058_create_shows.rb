class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.date :date
      t.time :start_time
      t.boolean :confirmed
      t.integer :user_id
      t.integer :act_id
      t.string :notes

      t.timestamps
    end
  end
end
