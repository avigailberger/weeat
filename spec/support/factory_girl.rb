require 'faker'
I18n.reload!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
