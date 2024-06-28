class Review < ApplicationRecord
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "image", "reviewer_name", "updated_at"]
  end

  has_one_attached :image

  validates :reviewer_name, presence: true
  validates :content, presence: true
end
