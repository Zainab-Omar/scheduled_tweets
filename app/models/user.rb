class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, format: { with: /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]/, message: "invalid email" }
    validates :password, presence: true
end
