class ChargesController < ApplicationController
  def new
    @amount = current_order.total_price * 100
    @address = Address.find(params[:address_id])
  end

  def create
    # Amount in cents
    @amount = (current_order.total_price * 100).to_i
    @address = Address.find(params[:address_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken],
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    binding.pry
    current_order.update({:status => "Paid",:address_id => @address.id})
    current_user.account.update({:address_id => @address.id})
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def charges_params
    params.require(:charges).permit(:address)
  end
end
