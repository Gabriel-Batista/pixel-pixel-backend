class User < ApplicationRecord
    has_many :projects
    has_secure_password
    validates :username, uniqueness: true
end
