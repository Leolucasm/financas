module ApplicationHelper
  def get_label_active(status)
    if status
      "<div class='badge badge-success'>#{t('helpers.active')}</div>".html_safe
    else
      "<div class='badge badge-danger'>#{t('helpers.inactive')}</div>".html_safe
    end
  end
end
