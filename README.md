# A Dwolla Fake

## Reference

[fake_stripe](https://github.com/thoughtbot/fake_stripe)

## Installation

### Gemfile

```ruby
# Gemfile
group :test do
  gem 'fake_dwolla'
end
```


### Rspec

Require the library in your spec support:

```ruby
# spec/support/fake_dwolla.rb
require 'fake_dwolla'

RSpec.configure do |config|
  config.before(:each) do
    FakeDwolla.stub_dwolla
  end
end
```
