class CheckoutController < ApplicationController
  def index; end

  def create
    bill = current_user.bills.create(status: 1)
    cart_params.each do |x|
      bill.bill_details.create product_id: x[:product_id], quantity: x[:quantity]
    end
    flash[:success] = "checkouted"
    redirect_to current_user
  end

  private

  def cart_params
    arr = []
    params[:itemCount].to_i.times do |x|
      x += 1
      product_id = params["item_options_#{x}"][/[0-9]/].to_i
      obj = {product_id: product_id, user_id: current_user.id,
        quantity: params["item_quantity_#{x}"]}
      arr.push obj
    end
    return arr
  end
end
