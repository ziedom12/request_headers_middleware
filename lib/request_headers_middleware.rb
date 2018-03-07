# frozen_string_literal: true
require 'request_headers_middleware/middleware'
require 'request_headers_middleware/version'

module RequestHeadersMiddleware # :nodoc:
  extend self

  attr_accessor :blacklist, :whitelist, :callbacks
  @whitelist = ['x-request-id'.to_sym]
  @blacklist = []
  @callbacks = []
  puts 'DONE'
  def store
    RequestStore[:headers] ||= {}
  end

  def setup(config)
    if config.whitelist
      @whitelist = config.whitelist.map { |key| key.downcase.to_sym }
    end
    if config.blacklist
      @blacklist = config.blacklist.map { |key| key.downcase.to_sym }
    end
    config.callbacks && @callbacks = config.callbacks
  end
end
