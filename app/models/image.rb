class Image < ApplicationRecord
  def image
    Product.find_by(id: product_id)
  end
end
