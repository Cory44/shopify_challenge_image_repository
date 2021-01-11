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
require 'rails_helper'

RSpec.describe Photo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
