# coding: utf-8
require 'bundler/setup'
require 'rspec'
require 'resque'
require 'simplecov'
require 'mock_redis'
require 'timecop'

Resque.redis = MockRedis.new

SimpleCov.start

require 'resque/integration'

require 'combustion'
Combustion.initialize! :action_controller

module ApiHelper
end

RSpec.configure do |config|
  config.before do
    Resque.redis.redis.flushdb
  end
end
