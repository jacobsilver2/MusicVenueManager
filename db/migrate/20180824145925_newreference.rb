class Newreference < ActiveRecord::Migration[5.1]
  def change
    add_reference :shows, :acts, foreign_key: true
  end
end
