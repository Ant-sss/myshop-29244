class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
        NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
        PHONE_REGEX = /[0-9]{11}/
        with_options presence: true do
          validates :family_name, :first_name, format: { with: NAME_REGEX }
          validates :password, format: { with: PASSWORD_REGEX }
          validates :phone_num, format: { with: PHONE_REGEX }
          validates :birthday, :nickname
        end

  has_many :items
  has_many :comments
  has_one :address
  has_one :card
  
end
