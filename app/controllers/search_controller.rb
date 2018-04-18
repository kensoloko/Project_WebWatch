class SearchController < ApplicationController
  def index
    q = params[:search]
    products = Product.search(name_cont: q).result
    @items = products
    respond_to do |format|
      format.html
      format.js
    end
  end
end
