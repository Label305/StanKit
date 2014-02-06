Pod::Spec.new do |s|
  s.name         = "StanKit"
  s.version      = "1.0"
  s.summary      = "iOS library with various extensions on the default iOS SDK, used at Label305 for app development."

  s.license      = {
    :type => 'Commercial',
    :text => <<-LICENSE
              © 2014 Label305 BV. All rights reserved.
    LICENSE
  }

  s.author       = { "Thijs Scheepers" => "thijs@label305.com" }

  s.platform     = :ios, '7.0'
  s.source_files = 'Classes/*.{h,m}'

  s.dependency 'TestFlightSDK', '~> 2.1'
  s.dependency 'CrashlyticsFramework', :git => "https://github.com/bpoplauschi/CrashlyticsFramework.git"

  s.requires_arc = true
end