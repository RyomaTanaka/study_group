# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :event
  mount_uploader :image, ImageUploader
  
  validates :image, presence: true
end
