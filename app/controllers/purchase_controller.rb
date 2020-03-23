class PurchaseController < ApplicationController
  


  require 'payjp'
  def index
    @product = Product.find(params[:product_id])
    @address = UserAdress.where(user_id: current_user.id)
    card = Creditcard.where(user_id: current_user.id).first
    if card.blank? 
      redirect_to controller: "credit_cards", action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      
    end
  end

  def pay
    @product = Product.find(params[:product_id])
    card = Creditcard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    Payjp::Charge.create(
    :amount => @product.price,
    :customer => card.customer_id, 
    :currency => 'jpy', 
  )
  @product.update(buyer_id: current_user.id)
  redirect_to action: 'done'
  end

  def done
    @product = Product.find(params[:product_id])
  end

 
end
