class BillsController < ApplicationController
  before_action :load_bill

  def destroy
    if @bill.update_attributes status: 5
      flash[:success] = t ".cancel_bill_success"
      redirect_to current_user
    end
  end

  private

  def load_bill
    @bill = Bill.find_by id: params[:id]
    unless @bill
      flash[:danger] = t ".bill_not_found"
      redirect_to root_url
    end
  end
end
