class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum:25}, format: {with: valid_email_regix}
    before_save { self.email = email.downcase }
end