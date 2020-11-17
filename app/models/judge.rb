class Judge < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :judge_correct

  belongs_to :user
  belongs_to :post
  validates :judge_correct_id, numericality: { other_than: 1 , message: 'を選択してください'}
end
