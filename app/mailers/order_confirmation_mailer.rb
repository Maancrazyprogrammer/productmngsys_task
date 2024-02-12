class OrderConfirmationMailer < ApplicationMailer
  default from: 'muhammadnoumankhokhar52@gmail.com'
  def order_confirmation(user, cart, total_bill)
    @user = user
    @cart = cart
    @total_bill = total_bill
    mail(to: @user.email, subject: 'Order Confirmation')
  end
end
