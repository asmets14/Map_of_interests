module BootstrapFlashHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def full_width_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = {
        class: "alert fade in alert-#{type} #{tag_class}"
      }.merge(options)

      Array(message).each do |msg|
        msg = content_tag(:div,content_tag(:span, msg), class: "container")
        text = content_tag(:div, msg, tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages = content_tag(:div,
                       content_tag(:div,
                         content_tag(:div, flash_messages.join("\n").html_safe, class: "col-sm-12"),
                       class: "row"),
                     class: "container-fluid")
  end
end
