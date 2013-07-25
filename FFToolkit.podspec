Pod::Spec.new do |s|
  s.name     = 'FFToolkit'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = "A pile of @forresty's personal codez"
  s.homepage = 'https://github.com/forresty/FFToolkit'
  s.authors  = { 'Forrest Ye' => 'afu@forresty.com' }
  s.source   = { :git => 'https://github.com/forresty/FFToolkit.git', :tag => '0.0.1' }
  s.source_files = 'FFToolkit'
  s.requires_arc = true

  s.ios.deployment_target = '6.1'
end