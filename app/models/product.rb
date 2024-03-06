class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :description, length: { minimum: 20 }
  # validates :image_url, presence: true

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

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def images
    Image.where(product_id: id)
  end
end
