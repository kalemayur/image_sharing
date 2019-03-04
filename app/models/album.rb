class Album < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  validates :album_name, :owner, presence: true
  validates :images, :length => { :maximum =>25}
end
