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
require 'rails_helper'

RSpec.describe Album, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
