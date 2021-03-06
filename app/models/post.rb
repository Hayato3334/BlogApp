class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true, length: { maximum: 500}
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  default_scope -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w[title created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
