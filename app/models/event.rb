class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :images
  accepts_nested_attributes_for :images
  acts_as_ordered_taggable_on :content
  
  geocoded_by :address
  after_validation :geocode
end