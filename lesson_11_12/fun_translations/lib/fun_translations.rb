# frozen_string_literal: true

require 'json'
require 'faraday'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module FunTranslations
  def self.client(token = nil)
    FunTranslations::Client.new token
  end
end
