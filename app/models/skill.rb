class Skill < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :youtube
  has_one_attached :video
  belongs_to :user
  has_one :compare, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :video, presence: { message: 'を選択してください' }
  validates :youtube, presence: true
  validates :youtube_id, numericality: { other_than: 1, message: 'を選択してください' }
  validate :video_checker, if: :video_was_attached?
end

private
def video_checker
  extension=["video/mp4","video/mov","video/avi","video/wmv","video/flv","video/mpg","video/mkv"]
  unless video.content_type.in?(extension)
    errors.add(:video, "を添付してください")
  end
end

def video_was_attached?
  self.video.attached? 
end
