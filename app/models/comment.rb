class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  belongs_to :compare
end
