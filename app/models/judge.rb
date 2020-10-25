class Judge < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :judge_correct 
  
  belongs_to :user
  belongs_to :post
  validates  :comment, presence: true
  validates :judge_correct_id, numericality: { other_than: 1 } 

end
