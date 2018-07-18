module ApiHelper
    include Rack::Test::Methods
  
    def app
      Rails.application
    end
  end
  
  RSpec.configure do |config|
    config.include ApiHelper  #apply to all spec for apis folder
    config.include Rails.application.routes.url_helpers
  end