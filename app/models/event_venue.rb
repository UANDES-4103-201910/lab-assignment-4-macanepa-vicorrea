class EventVenue < ApplicationRecord
  validates :name, length: { minimum: 20 }
  validates :capacity, numericality: {only_integer: true}
end
