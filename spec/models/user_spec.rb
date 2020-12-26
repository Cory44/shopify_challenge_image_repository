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
