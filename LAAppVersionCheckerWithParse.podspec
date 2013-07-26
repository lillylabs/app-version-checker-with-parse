# Just a simple podspec. 

# If you're testing locally it will ignore the source/tag reference. This could potentially
# be used by people using `pod "ExampleLib", :git => "https://github.com/orta/ExampleLib.git"`

# Most people will use the version in the Cocoapods Spec repo, which provides a snapshot for your
# library's state at that version.

# Documentation for podspecs: http://docs.cocoapods.org/specification.html

Pod::Spec.new do |s|
  s.name         =  'LAAppVersionCheckerWithParse'
  s.version      =  '0.1.2'
  s.license      =  { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     =  'http://labs.lillyapps.no'
  s.authors      =  { 'Tom Erik Støwer' => 'tomerik@tomerikstower.com' }
  s.source       =  { :git => 'git@bitbucket.org/testower/lilly-apps-appversioncheckerwithparse.git', :tag => s.version.to_s }
  s.summary      =  'Check current app version for a list of available versions maintained in a Parse-app table.'
  s.source_files = "Classes/LAAppVersionCheckerWithParse.{m,h}"
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse/Parse.framework/Headers"' }
  s.dependency 'Parse'
  s.preserve_path = "Resources/LAAppVersionCheckerWithParse-Localizable.strings"
end
