class SearchController < ApplicationController
  def index
    @items = Product.search(name_cont: params[:search]).result
    respond_to do |format|
      format.html
      format.js
    end
  end
end
