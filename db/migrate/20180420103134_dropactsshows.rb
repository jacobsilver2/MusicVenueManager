class Dropactsshows < ActiveRecord::Migration[5.1]
  def change
    drop_table :acts_shows
  end
end
