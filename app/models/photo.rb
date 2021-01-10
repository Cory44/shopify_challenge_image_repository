class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_and_belongs_to_many :albums
end
