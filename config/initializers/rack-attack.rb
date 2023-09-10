# frozen_string_literal: true

Rack::Attack.enabled = ENV['ENABLE_RACK_ATTACK'] || Rails.env.production?

class Rack::Attack
  Rack::Attack.blocklist('block all outer routes ') do |request|
    # Requests are blocked if the return value is truthy
    routes_array = Rails.application.routes.routes.flat_map { |r| r.path.spec.to_s }.uniq.map { |path| path&.gsub('(.:format)', '') }
    # allow assets url
    if request.path.start_with?('/assets')
      false
    else
      !routes_array.include?(request.path)
    end
  end

  throttle('req/ip', limit: 300, period: 30) do |request|
    request.ip unless request.path.start_with?('/assets')
  end

  ActiveSupport::Notifications.subscribe(/rack_attack/) do |name, start, finish, request_id, payload|
    req = payload[:request]
    if %i[throttle].include? req.env['rack.attack.match_type']
      info = "Remote Ip: #{req.ip}"
      rack_attack_throttle_data = req.env['rack.attack.throttle_data']['req/ip']
      Rails.logger.info info
      Notifier.rack_attack_error_mail(info, rack_attack_throttle_data&.stringify_keys).deliver
    end
  end

  Rack::Attack.blocklisted_response = lambda do |_env|
    html = ActionView::Base.empty.render(file: 'public/500.html')
    [403, { 'Content-Type' => 'text/html' }, [html]]
  end
end
