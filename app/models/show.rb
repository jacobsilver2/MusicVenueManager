class Show < ApplicationRecord
  belongs_to :user
  has_many :acts

  def self.today
  end

  def self.this_week
  end


end
