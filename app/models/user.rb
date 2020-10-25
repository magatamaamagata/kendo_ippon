class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  validates :nickname, :grade_id, presence: true
  has_many :posts
  has_many :judges
  has_one :level
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :grade
  # validates :nickname,:grade, presence: true
  # validates :grade_id, numericality: { other_than: 1 } 
end
