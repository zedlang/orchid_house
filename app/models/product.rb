class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :items
  has_many :baskets, through: :items

  validates :quantity, presence: true, 
  numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :name, presence: true


  #Elastic Search related code

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
    end
  end

  def as_indexed_json(options={})
    as_json(
      only: [:name] 
    )
  end

  Product.first.__elasticsearch__.index_document
  Product.import
end


