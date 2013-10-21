require 'coveralls'
Coveralls.wear!

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
require 'factory_girl'
FactoryGirl.reload

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryGirl::Syntax::Methods
end
