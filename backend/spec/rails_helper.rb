ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.check_pending!

module RackTestHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def post_json(url, obj)
    post(url, obj.to_json, {
        'CONTENT_TYPE' => 'application/json'
    })
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include RackTestHelper, type: :racktest
end