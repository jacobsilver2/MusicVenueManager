class Act < ApplicationRecord
  # has_many :shows, :through => :acts_shows
  has_and_belongs_to_many :shows  
  
end
