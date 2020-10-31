class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  validates :nickname, :grade_id, presence: true
  has_many :posts, dependent: :destroy
  has_many :judges, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_one :level
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :grade
  # validates :nickname,:grade, presence: true
  # validates :grade_id, numericality: { other_than: 1 } 
end
