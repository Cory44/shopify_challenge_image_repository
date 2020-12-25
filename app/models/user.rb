class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, authentication_keys: [:username]

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def email_required?
    false
  end

  # def email_changed?
  #   false
  # end

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
