# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string
#  tags       :string           default([]), is an Array
#  private    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  attr_accessor :images
  belongs_to :user
  has_and_belongs_to_many :photos


end
