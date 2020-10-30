class Compare < ApplicationRecord
  belongs_to :skill
  has_one_attached :video
end
