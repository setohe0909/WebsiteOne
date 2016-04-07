# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.
require 'coveralls'
Coveralls.wear_merged! 'rails'

ENV['CUCUMBER'] = 'cucumber'

require 'cucumber/rails'
require 'cucumber/rspec/doubles'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'
require 'geocoder/lookups/base'
require 'geocoder/results/freegeoip'
require 'webmock/cucumber'
require 'delorean'
require 'billy/cucumber'

WebMock.disable_net_connect!(allow_localhost: true)

OmniAuth.config.logger.level = Logger::WARN

Capybara.javascript_driver = :poltergeist_billy

Billy.configure do |c|
  c.cache = true
  c.ignore_params = ['http://maps.googleapis.com/maps/gen_204',
                     'http://maps.googleapis.com/maps/api/js/AuthenticationService.Authenticate',
                     'http://csi.gstatic.com/csi',
                     'http://maps.gstatic.com/mapfiles/openhand_8_8.cur',
                     'http://www.google-analytics.com/collect',
                     'http://www.google-analytics.com/r/collect',
                     'http://www.google-analytics.com/__utm.gif',
                     'https://ssl.google-analytics.com/__utm.gif',
                     'https://api.stripe.com/v1/tokens',
                     'https://talkgadget.google.com/talkgadget/_/widget',
                     'https://referrer.disqus.com/juggler/event.js',
                     'https://q.stripe.com/',
                     'https://js.stripe.com/v2/',
                     'http://disqus.com/embed/comments/',
                     'https://checkout.stripe.com/api/bootstrap',
                     'https://checkout.stripe.com/api/counter',
                     'https://accounts.google.com/o/oauth2/postmessageRelay',
                     'https://api.mixpanel.com/track/',
                     'https://checkout.stripe.com/api/outer/manhattan',
                     'https://checkout.stripe.com/api/account/lookup',
                     'https://checkout.stripe.com/',
                     'https://checkout.stripe.com/v3/zLFRiPN3qLIm2QDkJZxBw.html',
                     'https://checkout.stripe.com/v3/data/locales/en_gb-TXHkb1MWMa7xOQfCZf1DFA.json',
                     'http://a.disquscdn.com/uploads/users/20073/6166/avatar92.jpg',
                     'https://accounts.google.com/o/oauth2/postmessageRelay',
                     'http://disqus.com/api/3.0/embed/threadDetails.json',
                     'https://referrer.disqus.com/juggler/event.js',
                     'https://referrer.disqus.com/juggler/event.gif',
                     'https://talkgadget.google.com/talkgadget/_/widget',
                     'http://www.google-analytics.com/r/__utm.gif',
                     'https://disqus.com/home/preload',


  ]
  c.persist_cache = true
  c.cache_path = 'features/req_cache/'
  c.dynamic_jsonp = true
  c.dynamic_jsonp_keys = ["callback"]
end
Billy.proxy.reset_cache


Capybara.default_max_wait_time = 5

test_options = {
    timeout: 20,
    phantomjs_options: ['--ignore-ssl-errors=yes', "--proxy=#{Billy.proxy.host}:#{Billy.proxy.port}"],
    phantomjs: Phantomjs.path
}

debug_options = {
    inspector: true,
    timeout: 10,
    phantomjs_options: ["--proxy=#{Billy.proxy.host}:#{Billy.proxy.port}"],
    phantomjs: Phantomjs.path
}

Capybara.register_driver :poltergeist_billy do |app|
  Capybara::Poltergeist::Driver.new app, test_options
end

Capybara.register_driver :poltergeist_billy_debug do |app|
  Capybara::Poltergeist::Driver.new app, debug_options
end

ActionController::Base.allow_rescue = false

Cucumber::Rails::Database.javascript_strategy = :truncation

Geocoder.configure(ip_lookup: :test)
Geocoder::Lookup::Test.add_stub(
    '127.0.0.1', [
    {
        ip: '127.0.0.1',
        country_code: 'SE',
        country_name: 'Sweden',
        region_code: '28',
        region_name: 'Västra Götaland',
        city: 'Alingsås',
        zipcode: '44139',
        latitude: 57.9333,
        longitude: 12.5167,
        metro_code: '',
        areacode: ''
    }.as_json
]
)

Before do
  Settings.reload!
end
