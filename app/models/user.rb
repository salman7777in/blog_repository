class User < ActiveRecord::Base
    has_many :articles
    has_secure_password

    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum:25}, format: {with: VALID_EMAIL_REGEX}
    before_save { self.email = email.downcase }
end