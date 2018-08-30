
Pod::Spec.new do |s|
  s.name         = "QualarooMobileSdk"
  s.version      = "1.8.1"
  s.summary      = "QualarooMobileSdk"
  s.description  = "React Native Bridge for Qualaroo SDK"              
  s.homepage     = "qualaroo.com"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "contact@qualaroo.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/qualaroo/QualarooSDKiOS", :tag => "master" }
  s.source_files  = "QualarooMobileSdk/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "Qualaroo"

end
