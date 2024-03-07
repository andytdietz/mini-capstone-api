class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :phone_number, presence: true
  has_many :products

  def images
    Product.where(supplier_id: id)
  end
end
