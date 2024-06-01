class OrderItemMailer < ApplicationMailer

  def order_item_mail
    @order = params[:order]
    mail(to: @order.email, subject: '商品のご購入ありがとうございます')
  end
end
