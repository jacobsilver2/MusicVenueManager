class CreateActs < ActiveRecord::Migration[5.1]
  def change
    create_table :acts do |t|
      t.string :name
      t.string :website
      t.string :blurb
      t.string :contact_name
      t.string :contact_email
      t.string :notes

      t.timestamps
    end
  end
end
