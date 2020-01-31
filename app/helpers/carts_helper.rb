module CartsHelper
  def cart_full_price(cart_items)
    cart_full_price = 0.0
    cart_items.each do |cart_item|
      cart_full_price += cart_item.price * cart_item.quantity
    end
    return cart_full_price
  end
end
