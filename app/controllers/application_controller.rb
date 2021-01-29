class ApplicationController < ActionController::Base
  require './lib/modal_responder'

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
end
