class Category < ApplicationRecord
    validates_presence_of :name,:description
    has_one_attached :image    
    attr_accessor :preview
    validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], unless: :preview
end
