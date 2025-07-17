require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "CountryDetector"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = "n/a"
  s.license      = "Copyright © 2024 Calico Games. All rights reserved."
  s.authors      = { "Sebastien Menozzi" => "seb@calico.games" }
  s.platforms    = { :ios => min_ios_version_supported }
  s.source       = { :git => "n/a", :tag => "#{s.version}" }

  s.requires_arc = true

  s.dependency 'React-Core'

  s.source_files = 'ios/*.{h,m,swift}'
end