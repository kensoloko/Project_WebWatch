class Admin::BillsController < Admin::BaseController
  before_action :load_bill, except: :index
  def index
    @bills = Bill.all
  end

  def edit
    @options = []
    5.times do |x|
      option = [t("bills.bill.bill_status_#{x + 1}"), x + 1]
      @options << option
    end
  end

  def update
    @bill.update_attributes bill_params
    @bills = Bill.all
  end

  private
  def load_bill
    @bill = Bill.find_by id: params[:id]
  end

  def bill_params
    params.require(:bill).permit :status
  end
end
