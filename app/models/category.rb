class Category < ApplicationRecord
    has_and_belongs_to_many :stores
    validates_presence_of :name,:description
    validates_uniqueness_of :name
    has_one_attached :image    
    attr_accessor :preview
    validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], unless: :preview
end
