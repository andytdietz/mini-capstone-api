class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def subtotal
    product.price * quantity
  end

  def tax
    tax_rate = 0.09
    subtotal * tax_rate
  end

  def total
    total_price = subtotal + tax
  end
end

# 1 Create "Buy Now" button for each product
# 2 User clicks buy now
# 3 authenticate user
# if user is authenticated, moves to next step, else "please login to complete your order"
# 4 user enters shipping/billing info, validate address
# if address valid, move to next step, else return errors
# 5 user enters payment info (encrypted)
# 6 Secure Payment Confirmation
# if SPC valid, then move onto next step, else return errors
# 7 Receipt generated, sent to order fulfillment
