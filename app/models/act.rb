class Act < ApplicationRecord
  has_and_belongs_to_many :shows  
  validates :name,
            :presence => {:message => "Name can't be blank."},
            :uniqueness => {:message => "Name already exists."}

  validates :contact_name, :presence => {:message => "Please enter a contact name" }
  validates :contact_email, :presence =>  {:message => "Please enter a contact email"}
  
end


