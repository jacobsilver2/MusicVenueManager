class CreateShowsActsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :shows, :acts do |t|
      # t.index [:show_id, :act_id]
      # t.index [:act_id, :show_id]
    end
  end
end
