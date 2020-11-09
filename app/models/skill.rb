class Skill < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :youtube
  has_one_attached :video
  belongs_to :user
  has_one :compare, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :video, presence: { message: 'を選択してください'}
  validates :youtube, presence: true
  validates :youtube_id, numericality: { other_than: 1 , message: 'を選択してください'}
end
# validate :video_type

# private
# def video_type
#   videos.each do |video|
#     if !video.blob.content_type.in?(%('video/mp4 video/mov video/avi video/wmv'))
#       video.purge
#       errors.add(:video, 'はmp4,avi,wmvまたはmov形式でアップロードしてください')
#     end
#   end
# end