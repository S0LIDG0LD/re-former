class User < ApplicationRecord
  validates :username, presence: true, length: { in: 8..32 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 8..16 }
end
