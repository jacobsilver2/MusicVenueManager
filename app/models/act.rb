class Act < ApplicationRecord
  has_many :act_shows, :dependent => :destroy
  has_many :shows, :through => :act_shows  
  accepts_nested_attributes_for :act_shows, allow_destroy: true

  validates :name,
            :presence => {:message => "Name can't be blank."},
            :uniqueness => {:message => "Name already exists."}

  validates :contact_name, :presence => {:message => "Please enter a contact name" }
  validates :contact_email, :presence =>  {:message => "Please enter a contact email"}
  
end


