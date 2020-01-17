class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    mail to: order.user.email, subject: "Order successfully created"
  end
end
