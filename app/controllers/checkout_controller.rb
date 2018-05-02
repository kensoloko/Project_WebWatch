class CheckoutController < ApplicationController
  def index; end

  def create
    array = []
    cart_params.each do |x|
      array << {product_id: x[:product_id], quantity: x[:quantity]}
    end
    bill = current_user.bills.new status: 1, bill_details_attributes: array
    if bill.save
      flash[:success] = t "checkouted"
      redirect_to user_bills_path current_user
    else
      flash.now[:error] = t ".fail"
      render :index
    end
  end

  private

  def cart_params
    arr = []
    params[:itemCount].to_i.times do |x|
      x += 1
      product_id = params["item_options_#{x}"].delete("pid:").to_i
      obj = {product_id: product_id, user_id: current_user.id,
        quantity: params["item_quantity_#{x}"]}
      arr.push obj
    end
    arr
  end
end
