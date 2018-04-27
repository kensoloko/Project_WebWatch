class CommentsController < ApplicationController
  before_action :load_product, only: :create

  def create
    @comment = @product.comments.new comment_params
    if @comment.save
      respond_to do |format|
        format.html{redirect_to @product}
        format.js
      end
    else
      redirect_to root_url
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:comment][:product_id]
    unless @product
      flash[:warning] = t "product_not_found"
      redirect_to root_path
    end
  end

  def comment_params
    params.require(:comment).permit :user_id, :content
  end
end
