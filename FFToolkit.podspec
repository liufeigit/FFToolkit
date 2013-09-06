Pod::Spec.new do |s|
  s.name             = 'FFToolkit'
  s.version          = '0.0.1'
  s.license          = 'MIT'
  s.summary          = "A pile of @forresty's personal codez"
  s.homepage         = 'https://github.com/forresty/FFToolkit'
  s.authors          = { 'Forrest Ye' => 'afu@forresty.com' }
  s.source           = { :git => 'https://github.com/forresty/FFToolkit.git', :tag => '0.0.1' }
  s.ios.source_files = 'FFToolkit/**/*{.h,.m}'
  s.osx.source_files = 'FFToolkit/Shared'
  s.requires_arc     = true

  # TODO: require iAd framework in order to build is ugly
  s.ios.frameworks = 'iAd'
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
end
