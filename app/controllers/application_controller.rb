class ApplicationController < ActionController::Base
  before_action do
    @author = cookies[:author] ||= Faker::Internet.username
  end

  rescue_from ActiveRecord::StatementInvalid do |e|
    raise e unless e.cause.is_a?(PG::ReadOnlySqlTransaction)

    r = ENV['PRIMARY_REGION']
    response.headers['fly-replay'] = "region=#{r}"
    Rails.logger.info "Replaying request in #{r}"
    render plain: "retry in region #{r}", status: 409
  end
end
