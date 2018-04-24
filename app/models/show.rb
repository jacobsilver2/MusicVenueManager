class Show < ApplicationRecord
  belongs_to :user
  has_many :act_shows
  has_many :acts, :through => :act_shows
   
  
  validates_uniqueness_of :date, :message => "That date is already taken.  Please choose another."
  validates_presence_of :start_time, :message => "Please enter a valid start time"
  validates_presence_of :date, :message => "Please enter a valid date"
  

  def format_confirmed
    if self.confirmed
      "Yes"
    else
      "No"
    end
  end
  

  



  def self.confirmed_shows_by_date
    Show.all.select{|show| show.confirmed}.sort{|a,b| a.date <=> b.date}
  end
    
  def self.shows_by_date
    Show.all.sort{ |a,b| a.date <=> b.date}
  end

  def self.today_confirmed
    t = Date.today
    Show.all.detect{ |show| (show.date == t) && show.confirmed}
  end

  def self.today_all
    t = Date.today
    Show.all.detect{ |show| show.date == t}
  end

  def self.this_week_confirmed
    oneWeek = Date.today + 7
    Show.all.select{|show| (show.date < oneWeek) && show.confirmed }.sort{|a,b| a.date <=> b.date}
  end

  def self.this_week_all
    oneWeek = Date.today + 7
    Show.all.select{|show| show.date < oneWeek}.sort{|a,b| a.date <=> b.date}
  end


  


end
