class Skill < ApplicationRecord
  has_one_attached :video
  belongs_to :user

end
