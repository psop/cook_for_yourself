class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @order_items = @order.items
    @order_info  = @order.info

    mail(to: @user.email , subject: "[Cook For Yourself] Thank you for shopping. This is your order number #{order.token}")
  end
end
