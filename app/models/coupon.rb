class Coupon < ApplicationRecord
    belongs_to :store
    validates_presence_of :name,:description,:code,:url
    validates_uniqueness_of :name,:code
    validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, :multiline => true
end
