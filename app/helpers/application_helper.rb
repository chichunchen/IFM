module ApplicationHelper

  def notice_message
    alert_types = { :notice => :success, :alert => :danger }

    close_button_options = { :class => "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, :class => alert_class)
    end

    alerts.join("\n").html_safe
  end

  def contact_dev
    mail_to( "chi.chun_chen@icloud.com",
                 "任何建議",
                 :subject => "資財二手書-建議",
                 :encode => "javascript" )
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end

