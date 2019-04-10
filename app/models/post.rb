class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true, length: { maximum: 1000}
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    %w[title created_at]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
