$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "ssl-date-checker/version"

module SslDateChecker
end

require 'ssl-date-checker/main'
