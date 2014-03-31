Pod::Spec.new do |s|
  s.name         = "StanKit"
  s.version      = "1.1"
  s.summary      = "iOS library with various extensions on the default iOS SDK, used at Label305 for app development."

  s.license      = {
    :type => 'Apache 2.0',
    :text => <<-LICENSE
Copyright 2014 Label305 B.V.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    LICENSE
  }

  s.author       = { "Thijs Scheepers" => "thijs@label305.com" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec "Core" do |sp|
    sp.source_files = 'Classes/Core/*.{h,m}', 'Classes/StanKit.h'

    sp.dependency 'TestFlightSDK', '~>3.0'
    sp.dependency 'CrashlyticsFramework', '~>2'
  end

  s.subspec "Analytics" do |sp|
    sp.source_files = 'Classes/Analytics/*.{h,m}', 'Classes/Analytics.h'

    sp.dependency 'GoogleAnalytics-iOS-SDK', '~> 3.0.6'
  end

  s.default_subspec = 'Core'
  
end
