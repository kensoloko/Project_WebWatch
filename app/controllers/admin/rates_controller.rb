class Admin::RatesController < Admin::BaseController
  def index
    @rates = Rate.all
  end
end
