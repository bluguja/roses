class User < ActiveRecord::Base
    has_many :roses
    has_secure_password #bcrypt gem
    validates_uniqueness_of :username
    validates_presence_of :username
end