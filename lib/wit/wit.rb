require 'faraday'
require 'json'
require 'ostruct'

module Wit
  class Unauthorized < Exception; end
  class BadResponse < Exception; end
end
