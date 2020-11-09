class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :text, presence: true,length: { maximum: 140 }
  validates :skill_id, presence: true
  validates :user_id, presence: true
end
