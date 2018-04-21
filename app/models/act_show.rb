class ActShow < ApplicationRecord
  belongs_to :act
  belongs_to :show

  def self.setOrder(act, show)
    ActShow.where("act_id = ? AND show_id = ?", act.id, show.id).first.set_order.ordinalize
  end
end
