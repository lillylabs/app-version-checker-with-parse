Pod::Spec.new do |s|
  s.name         =  'LAAppVersionCheckerWithParse'
  s.version      =  '0.1.6'
  s.summary      =  'Check current app version for a list of available versions maintained in a Parse-app table.'
  s.homepage     =  'http://labs.lillyapps.no'
  s.license      = 'MIT'
  s.author       =  { 'Tom Erik Støwer' => 'tomerik@tomerikstower.com' }
  s.source       =  { :git => 'git@bitbucket.org:lillyapps/lilly-apps-appversioncheckerwithparse.git', :tag => s.version.to_s }
  
  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true
  
  s.source_files = 'Classes/ios/*.{h,m}'
  s.preserve_path = "Assets/LAAppVersionCheckerWithParse-Localizable.strings"
  
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse/Parse.framework/Headers"' }
  
  s.dependency 'Parse', '~> 1.2'
  
end
