class Users::RegistrationsController < Devise::RegistrationsController

before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = current_user
  end

  def update
    #binding.pry
    super
    # if @user.update(params[:user])
    #   flash[:notice] = "User has been updated."
    #   redirect_to show_path
    # else
    #   flash.now[:alert] = "User has not been updated."
    #   render "edit"
    # end
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, addresses_attributes: [:id, :address1, :address2, :city, :postcode]])
  end
end