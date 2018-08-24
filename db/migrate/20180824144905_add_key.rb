class AddKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :shows, :acts
  end
end
