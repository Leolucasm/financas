class ApplicationController < ActionController::Base
  require './lib/modal_responder'

  before_action :configure_permitted_parameters, if: :devise_controller?

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  def formatValuesToSave(*values)
    values.each do |value|
      if value.present? && value.include?(',')
        value.gsub!(/\./,'') # '1.000,00' -> '1000,00'
        value.gsub!(/,/,'.') # '1,23' -> '1.23'
      end
    end
  end

  protected

  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
