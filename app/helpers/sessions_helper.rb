module SessionsHelper
  def login user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def save_product product
    p = {id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
      first_image: product.first_image.to_s
    }
    if session[:products].blank?
      session[:products] = []
    else
      session[:products] = session_products
    end
    session[:products] << p
    session[:products].uniq! {|x| x[:id]}
    session[:products].shift if session[:products].to_a.length > 4
  end

  def session_products
    session[:products].map do |h|
      h = h.inject({}){|m,(k,v)| m[k.to_sym] = v; m}
    end
  end

  def session_products?
    session[:products].present?
  end
end
