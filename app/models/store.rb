class Store < ApplicationRecord   
    has_and_belongs_to_many :categories
    has_many :coupons
    validates_presence_of :name,:description,:categories
    validates_uniqueness_of :name, if: :name
    has_one_attached :image    
    attr_accessor :preview
    validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], unless: :preview
    scope :topbrand,-> { where(topbrand: true) }

    def self.reorder(stores)
        ids = stores.map { |store| store[:id] }
        @stores = Store.where(id: ids)
        ActiveRecord::Base.transaction do
          stores.each do |str|
            store = @stores.select{|j| j.id == str[:id]}.first
            store.update_attribute('sort', str[:order])
          end
        end
        self.where(topbrand: true).order(:sort).all 
    end

end
