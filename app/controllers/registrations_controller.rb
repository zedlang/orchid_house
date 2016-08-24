class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    build_resource({})
    resource.addresses = Address.new
    respond_with self.resource
  end
 
  def create
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, address_attributes: [:address1, :address2, :city, :postcode]])
  end
end