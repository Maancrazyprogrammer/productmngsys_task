class OrderConfirmationMailer < ApplicationMailer
  def order_confirmation(user, cart, total_bill)
    @user = user
    @cart = cart
    @total_bill = total_bill
    mail(to: @user.email, subject: 'Order Confirmation')
  end
end
