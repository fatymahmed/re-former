class User < ApplicationRecord
    validates :username, presence: true ,uniqueness: {case_sensitive: false}, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    validates :email, presence: true, format: VALID_EMAIL_REGEX, uniqueness: {case_sensitive: false}, length: {maximum: 140}
    validates :password, presence: true, length: {in: 8..20}
end
