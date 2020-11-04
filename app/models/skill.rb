class Skill < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :youtube
  has_one_attached :video
  belongs_to :user
  has_one :compare, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :youtube, presence: true
  validates :youtube_id, numericality: { other_than: 1 }
end
