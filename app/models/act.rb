class Act < ApplicationRecord
  has_many :act_shows
  has_many :shows, :through => :act_shows  

  validates :name,
            :presence => {:message => "Name can't be blank."},
            :uniqueness => {:message => "Name already exists."}

  validates :contact_name, :presence => {:message => "Please enter a contact name" }
  validates :contact_email, :presence =>  {:message => "Please enter a contact email"}
  
end


