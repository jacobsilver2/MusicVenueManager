class Show < ApplicationRecord
  belongs_to :user
  has_many :acts
  validates_uniqueness_of :date, :message => "That date is already taken.  Please choose another."
  validates_presence_of :start_time, :message => "Please enter a valid start time"
  validates_presence_of :date, :message => "Please enter a valid date"

  def format_date
    self.date.strftime("%B %e, %Y")
  end

  def format_time
    self.start_time.strftime("%l:%M %p")
  end

  def format_confirmed
    if self.confirmed
      "Yes"
    else
      "No"
    end

  end


  def self.today
  end

  def self.this_week
  end


end
