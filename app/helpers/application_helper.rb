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
    @message_error = "<ul>"
    errors.full_messages.each do |error|
      @message_error += "<li>#{error}</li>"
    end

    @message_error += "</ul>"

    "<div class='alert alert-danger'>
      Erros encontrados:
      #{@message_error}
    </div>".html_safe
  end
end
