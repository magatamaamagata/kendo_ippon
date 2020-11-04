class Compare < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :public
  has_one_attached :video

  belongs_to :skill, optional: true

  validates :public, presence: true
  validates :public_id, numericality: { other_than: 1 }
end
