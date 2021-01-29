module ApplicationHelper
  def get_label_active(status)
    if status
      "<div class='badge badge-success'>#{t('helpers.active')}</div>".html_safe
    else
      "<div class='badge badge-danger'>#{t('helpers.inactive')}</div>".html_safe
    end
  end

  # Types: primary, secondary, success, danger, warning
  #        info, light, dark
  def get_alert(type, title, description)
    "<div class='alert alert-#{type.to_s}'>
      <div class='alert-title'>#{title}</div>
      #{description}
    </div>".html_safe
  end

  def get_alert_error(errors)
    @message_error = "<ul class='list-group list-group-flush' style='margin-top: 10px;'>"

    if errors.class == Array
      errors.each do |error|
        @message_error += "<li class='list-group-item alert-danger-item'>#{error}</li>"
      end
    else
      @message_error += "<li class='list-group-item alert-danger-item'>#{errors}</li>"
    end

    @message_error += "</ul>"

    "<div class='alert alert-danger'>
      <span style='font-weight: bold;'>Erros encontrados:</span>
      #{@message_error}
    </div>".html_safe
  end

  def currencyf(value)
    number_to_currency(value, unit: "", separator: ",", delimiter: ".")
  end
end
