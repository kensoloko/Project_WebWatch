class BillsController < ApplicationController
  before_action :load_user
  before_action :load_bills, only: :index
  before_action :load_bill, only: :destroy

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    if @bill.update_attributes status: 5
      flash[:success] = t "cancel_bill_success"
      redirect_to user_bills_path
    end
  end

  def show
  end

  private

  def load_user
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:error] = t ".user_not_found"
      redirect_to root_url
    end
  end

  def load_bill
    @bill = Bill.find_by id: params[:id]
    unless @bill
      flash[:error] = t ".bill_not_found"
      redirect_to root_url
    end
  end

  def load_bills
    @bills = @user.bills.status(params[:status]).time(params[:time])
  end
end
