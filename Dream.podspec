Pod::Spec.new do |s|
  s.name             = "Dream"
  s.summary          = "A short description of Dream."
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/3lvis/Dream"
  s.license          = 'MIT'
  s.author           = { "Elvis Nuñez" => "elvisnunez@me.com" }
  s.source           = { :git => "https://github.com/3lvis/Dream.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/3lvis'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  
  s.requires_arc = true
  s.source_files = 'Source'
  s.frameworks = 'Foundation'
  s.dependency 'Networking', '~> 0.9.0'
end
