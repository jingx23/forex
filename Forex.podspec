Pod::Spec.new do |s|
  s.name             = "Forex"
  s.version          = "1.0.0"
  s.summary          = "Foreign exchange rates and currency conversion framework"
  s.homepage         = "https://github.com/jingx23/forex"
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { "Jan Scheithauer" => "jan@jingx.net" }
  s.source           = { git: "https://github.com/jingx23/forex.git", tag: s.version.to_s }
  s.social_media_url = 'https://twitter.com/jingx23'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.ios.source_files = 'Sources/**/*.{swift}'
  # s.resource_bundles = {
  #   'Forex' => ['Forex/Sources/**/*.xib']
  # }
  # s.ios.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'Eureka', '~> 4.0'
end
