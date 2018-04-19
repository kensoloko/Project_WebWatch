class CheckoutController < ApplicationController
  def index; end

  def create
    render html: bill_details
  end

  private

  def bill_details
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
