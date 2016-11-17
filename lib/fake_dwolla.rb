require 'fake_dwolla/configuration'
require 'fake_dwolla/initializers/webmock'
require 'fake_dwolla/stub_app'

module FakeDwolla
  extend Configuration

  def self.stub_dwolla
    stub_request(:any, /api-uat.dwolla.com/).to_rack(FakeDwolla::StubApp)
  end
end
