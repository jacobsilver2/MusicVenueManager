class RemoveAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column(:shows, :act_id)
  end
end
