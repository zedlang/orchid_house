class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
 
  def create
    super
    associate_address
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, address_attributes: [:address1, :address2, :city, :postcode]])
  end

  def associate_address
    address1 = params[:user][:address][:address1]
    address2 = params[:user][:address][:address2]
    city = params[:user][:address][:city]
    postcode = params[:user][:address][:postcode]
    
    @user.addresses.build(:address1 => address1, :address2 => address2, :city => city, :postcode => postcode).save
  end
end