class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :judge_correct 
  belongs_to_active_hash :difficulity

  belongs_to :user
  has_many :judges
  
  validates :judge_correct, :difficulity, presence: true
  validates :judge_correct_id, :difficulity_id, numericality: { other_than: 1 } 
end
