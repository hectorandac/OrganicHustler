class CartProduct < ApplicationRecord
  belongs_to :cart, optional: true
  has_many :custom_logos
  has_many :custom_emblems

  def unbind_cart
    cart = self.cart
    cart.n_products = cart.n_products - 1
    cart.save!

    self.cart_id = ''
    self.save!
  end
end
