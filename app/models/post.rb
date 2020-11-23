class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :judge_correct
  belongs_to_active_hash :difficulity
  has_one_attached :video

  belongs_to :user
  has_many :judges, dependent: :destroy

  validates :judge_correct, :difficulity, :description, presence: true
  validates :judge_correct_id, :difficulity_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :description, length: { maximum: 400 }
  validates :video_or_gif_url, presence: true
  validate :video_checker, if: :video_was_attached?


  private

  def video_or_gif_url
    video.present? ^ gif_url.present?
  end

  def video_checker
    extension=["video/quicktime","video/mp4","video/mov"]
    unless video.content_type.in?(extension)
      errors.add(:video, "を添付してください")
    end
  end
  
  def video_was_attached?
    self.video.attached? 
  end
end
