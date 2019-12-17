class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :images
  accepts_nested_attributes_for :images
  
  geocoded_by :address
  after_validation :geocode
end