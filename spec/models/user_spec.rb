# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  username               :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'password_too_short' do
    user = User.new(username: 'test-user', password: '12345', password_confirmation: '12345')
    expect(user).to_not be_valid
  end

  it 'passwords_do_not_match' do
    user = User.new(username: 'test-user', password: 'password', password_confirmation: 'wordpass')
    expect(user).to_not be_valid
  end

  it 'username_is_nil' do
    user = User.new(password: 'password', password_confirmation: 'password')
    expect(user).to_not be_valid
  end

  it 'user_is_vald' do
    user = User.new(username: 'test-user', password: 'password', password_confirmation: 'password')
    expect(user).to be_valid
  end

end
