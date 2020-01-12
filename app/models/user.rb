class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_events
  has_many :events, through: :user_events

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  mount_uploader :icon, IconUploader

  validates :nickname, presence: true, length: { maximum: 8 }

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end