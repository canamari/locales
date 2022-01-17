class Property < ApplicationRecord
  has_many :property_images

  accepts_nested_attributes_for :property_images

  validate :name, presence: true

end
