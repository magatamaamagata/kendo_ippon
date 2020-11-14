class Compare < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :public
  has_one_attached :video
  belongs_to :skill, optional: true

  with_options presence: true do
    validates :keep,length: { maximum: 400 }
    validates :problem,length: { maximum: 400 }
    validates :make_better,length: { maximum: 400 }

  end
  validates :notice, length: { maximum: 400 }
  validates :public, presence: true
  validates :public_id, numericality: { other_than: 1 , message: 'を選択してください'}
end
