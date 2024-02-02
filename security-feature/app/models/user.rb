class User < ApplicationRecord
    has_secure_password
    has_many :uploads
    validates :email, presence: true
    
end
