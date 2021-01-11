# == Schema Information
#
# Table name: photos
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  description :text
#  tags        :string           is an Array
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  private     :boolean          default(FALSE)
#
class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_and_belongs_to_many :albums
end
