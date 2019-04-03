class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types

  validate :valid_date?

  def valid_date?
    if(start_date<Time.now)
      errors.add(:start_date, 'must be later than current date')
    end
  end


end
