class Compare < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :public
  has_one_attached :video
  belongs_to :skill, optional: true

  with_options presence: true do
    validates :sprits,length: { maximum: 140 }
    validates :posture,length: { maximum: 140 }
    validates :bamboo,length: { maximum: 140 }
    validates :position,length: { maximum: 140 }
    validates :sword,length: { maximum: 140 }
    validates :zanshin,length: { maximum: 140 }
    validates :sprits2,length: { maximum: 140 }
    validates :posture2,length: { maximum: 140 }
    validates :bamboo2,length: { maximum: 140 }
    validates :position2,length: { maximum: 140 }
    validates :sword2,length: { maximum: 140 }
    validates :zanshin2,length: { maximum: 140 }
  end
  validates :notice, length: { maximum: 400 }
  validates :public, presence: true
  validates :public_id, numericality: { other_than: 1 , message: 'を選択してください'}
end
