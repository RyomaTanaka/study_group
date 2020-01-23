# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  acts_as_ordered_taggable_on :content

  geocoded_by :address
  after_validation :geocode

  validates :title, presence: true, length: { maximum: 10 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :capacity, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: { maximum: 200 }
end
