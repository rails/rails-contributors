ActiveSupport::Notifications.subscribe("write_page.action_controller") do |event|
  Rails.logger.info "Page cached: #{event.payload[:path]}"
end

ActiveSupport::Notifications.subscribe("expire_page.action_controller") do |event|
  Rails.logger.info "Page expired: #{event.payload[:path]}"
end
