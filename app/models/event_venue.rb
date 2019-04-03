class EventVenue < ApplicationRecord
  validates :name, length: { minimum: 20, message: "must be minimum 20 characters long"}
  validates :capacity, numericality: {:greater_than => 0, only_integer: true, message: "must be positive integer"}
end
