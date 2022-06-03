# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart

  rescue_from ActionController::RoutingError, with: :render404
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized_error
  def render404
    redirect_to(request.referer || root_path)
  end

  def record_not_found
    flash[:notice] = 'Unable to find the records.'
    redirect_to(request.referer || root_path)
  end

  def not_authorized_error
    flash[:notice] = 'You are not authorized for this action.'
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :first_name, :last_name, :user_name, :status)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :first_name, :last_name, :user_name, :status)
    end
  end

  private

  def current_cart
    if user_signed_in?
      @current_cart = find_cart
      @current_cart ||= new_cart unless @current_cart
    else
      @current_cart = Cart.new
      @current_cart.total = 0
    end
    session[:cart_id] = @current_cart.id
  end

  def find_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def new_cart
    @current_cart = Cart.new
    @current_cart.user_id = current_user.id
    @current_cart.total = 0
    @current_cart.save
    @current_cart
  end
end
