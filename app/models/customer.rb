class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
        NAME_REGEX = /[ぁ-んァ-ン一-龥]/
        PHONE_REGEX = /[0-9]{11}/
        with_options presence: true do
          validates :family_name, :first_name, format: { with: NAME_REGEX }
          validates :password, format: { with: PASSWORD_REGEX }
          validates :phone_num, format: { with: PHONE_REGEX }
          validates :birthday, :nickname
        end

  has_many :items, dependent: :destroy
  has_many :itemcomments, dependent: :destroy
  has_many :tweetcomments, dependent: :destroy
  has_many :purchases
  has_one :residence, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
