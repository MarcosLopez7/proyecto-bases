class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :empleados
  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
