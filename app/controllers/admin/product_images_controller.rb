class Admin::ProductImagesController < Admin::BaseController
  def destroy
    @product_image = ProductImage.find(params[:id])
    product = @product_image.product
    @product_image.destroy
  end
end
