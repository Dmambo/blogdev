class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /users/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    super
  end

  # POST /users/sign_in

  # DELETE /users/sign_out

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
