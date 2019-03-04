class Image < ApplicationRecord
  belongs_to :album
  has_attached_file :photo
  validates_attachment :photo,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates :tag_line, :photo, presence: true
  validates_associated :album
end
