class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.admin?
      "/admin"
    else 
      "/"
    end
  end

  def basket_quantity
    return basket.quantity
  end

  helper_method :basket_quantity

  protected

  def basket
    @basket = Basket.find(session[:basket_id])
    rescue ActiveRecord::RecordNotFound
      @basket = Basket.create
      session[:basket_id] = @basket.id
      return @basket
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, addresses_attributes: [:address1, :address2, :city, :postcode]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, addresses_attributes: [:id, :address1, :address2, :city, :postcode]])
  end
end
