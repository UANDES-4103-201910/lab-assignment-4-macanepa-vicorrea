class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types

  validates_uniqueness_of :start_date, :scope => :event_venue_id, message: "there cannot be two or more events hosted in the same venue with the same start date."
  validate :valid_date?

  def valid_date?
    if(start_date<Time.now)
      errors.add(:start_date, 'must be later than current date')
    end
  end


end
