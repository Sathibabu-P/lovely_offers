class User < ApplicationRecord
    has_secure_password
    belongs_to :role
    validates_presence_of :name,:password,:password_confirmation,:role
    validates_uniqueness_of :name
    validates :password, confirmation: true   
    before_save :set_password

    def set_password
        self.spassword = password
    end
end
