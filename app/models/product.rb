class Product < ActiveRecord::Base
  has_one :photo

  accepts_nested_attributes_for :photo

  has_many :ingredients
  has_many :directions

  accepts_nested_attributes_for :ingredients,
                           reject_if: proc { |attributes| attributes['name'].blank? },
                           allow_destroy: true
  accepts_nested_attributes_for :directions,
                           reject_if: proc { |attributes| attributes['step'].blank? },
                           allow_destroy: true

  has_many :reviews
  belongs_to :category
end
