Geocoder API for RubyMotion
====================
[![Code Climate](https://codeclimate.com/github/he9qi/motion-geocoder.png)](https://codeclimate.com/github/he9qi/motion-geocoder)

This RubyMotion gem provides Geocoder functionality that integrate [Google's Geocoding API](https://developers.google.com/maps/documentation/geocoding/intro) and [Apple's Geocoder](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/LocationAwarenessPG/UsingGeocoders/UsingGeocoders.html) to your RubyMotion app. 

#### Google 
  * Geocoding API
  * Place API

#### Apple 
  * CLGeocoder
  * MKLocalSearch
  

## Setup

Add MotionGeocoder to your Gemfile, and run `bundle install`:
```ruby
gem 'motion-geocoder'
```

Edit the Rakefile of your RubyMotion project and add the following require line:
```ruby
# After the line that require Rubymotion
require 'bundler'
Bundler.require
```

To use google api, you need to register the key, i.e. in `app_delegate.rb`:
```ruby
MotionGeocoder::GoogleApi.register("key")
```

Usage
==========

Basic:

#### reverse geocoding
```ruby
MotionGeocoder::AppleApi::Geocode.(lat, lng) do |address|
      ...
    end
```

#### place search
```ruby
MotionGeocoder::AppleApi::Place.auto_complete "starbucks", \
        lat: @center.latitude, lng: @center.longitude do |results|
          ...
        end
```


## TODO
- still a lot of APIs to do

## Contributions

Fork, please!
