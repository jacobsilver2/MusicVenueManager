class Act < ApplicationRecord
  has_many :shows, through: :shows_acts
end
