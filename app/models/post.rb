class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :judge_correct
  belongs_to_active_hash :difficulity
  has_one_attached :video

  belongs_to :user
  has_many :judges, dependent: :destroy

  validates :judge_correct, :difficulity, :url_or_video, :description, presence: true
  validates :judge_correct_id, :difficulity_id, numericality: { other_than: 1 }

  validates , presence: true

  private
    def email_or_phone
      gif_url.presence or video.presence
    end
end
