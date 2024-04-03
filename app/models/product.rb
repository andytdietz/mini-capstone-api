class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :price, numericality: true
  # validates :description, length: { minimum: 20 }

  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products

  def is_discounted?
    price <= 10
  end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    total_price = price + tax
  end

  def images
    Image.where(product_id: id)
  end
end
