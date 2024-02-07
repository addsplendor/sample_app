class User < ActiveRecord::Base
   before_save { self.email = email.downcase } 
   validates :name, presence: true, length: { maximum: 50}
   VALID_EMAIL_REGEX = /\A[w+\-.]+@[a-z\-.]+\.[a-z]+/
   validates :email, presence: true, length: { maximum: 255 }
                     format: { with: VALID_EMAIL_REGEX }
                     uniqueness: { case_sensitive: false }
end