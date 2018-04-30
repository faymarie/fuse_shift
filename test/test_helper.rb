ENV['RAILS_ENV'] ||='test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'hasher'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include ApplicationHelper
  include RegistrationsHelper
  include Hasher
  include FactoryBot::Syntax::Methods
#   fixtures :all


  # Add more helper methods to be used by all tests here...
end
