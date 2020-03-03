class User < ApplicationRecord
  has_secure_password

  has_many :pictures, dependent: :destroy
end
