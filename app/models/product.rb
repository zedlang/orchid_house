class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mapping do
    indexes :name
  end

  has_many :items
  has_many :baskets, through: :items

  validates :quantity, presence: true, 
  numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :name, presence: true
end
