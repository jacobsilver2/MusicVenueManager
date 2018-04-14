class Show < ApplicationRecord
  #override AR default, and treat date as a date, not a string
  class << columns_hash['start_time']
    def type
      :date
    end
  end

  
  belongs_to :user
  has_many :acts

  def self.today
  end

  def self.this_week
  end


end
