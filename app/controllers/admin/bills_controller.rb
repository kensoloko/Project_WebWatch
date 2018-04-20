class Admin::BillsController < Admin::BaseController
  def index
    @bills = Bill.all
  end
end
