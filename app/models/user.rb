class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday , presence: true
PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{8,}+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX
with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, } do
  validates :first_name
  validates :last_name
  validates :first_name_kana
  validates :last_name_kana
  end
end