class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :nickname, :grade_id, presence: true
  has_many :posts, dependent: :destroy
  has_many :judges, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_one :level
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :grade
  validates :nickname, presence: true, length: {maximum: 20}
  validates :grade, presence: true
  validates :grade_id, numericality: { other_than: 1 , message: 'を選択してください'}

  def self.guest
    # 以下の情報を持ったユーザーを探す、または作成する
    find_or_create_by!(email: 'test@example.com', nickname: '浪人') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
