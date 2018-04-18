module ProductsHelper
  def fetch_category_name id
    @category = Category.find_by id: id
    if @category.nil?
      return t("admin.no_info")
    else
      return @category.name
    end
  end

  def fetch_brand_name id
    @brand = Brand.find_by id: id
    if @brand.nil?
    return t("admin.no_info")
    else
      return @brand.name
    end
  end
end
