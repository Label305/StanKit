Pod::Spec.new do |s|
  s.name         = "StanKit"
  s.version      = "1.0"
  s.summary      = "iOS library with various extensions on the default iOS SDK, used at Label305 for app development."

  s.license      = {
    :type => 'BSD',
    :text => <<-LICENSE
              © 2014 Label305 B.V. All rights reserved.
    LICENSE
  }

  s.author       = { "Thijs Scheepers" => "thijs@label305.com" }

  s.platform     = :ios, '7.0'
  s.source_files = 'Classes/*.{h,m}'

  s.dependency 'TestFlightSDK', '~>3.0'
  s.dependency 'CrashlyticsFramework', '~>2'

  s.requires_arc = true
end
