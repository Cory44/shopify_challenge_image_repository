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
class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, authentication_keys: [:username]

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      puts conditions
      if conditions.has_key?(:username)
        where(conditions.to_h).first
      end
    end
end
