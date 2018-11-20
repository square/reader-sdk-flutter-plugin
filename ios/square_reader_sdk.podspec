#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'square_reader_sdk'
  s.version          = '0.0.1'
  s.summary          = 'iOS part of a flutter plugin for Square Reader SDK.'
  s.description      = <<-DESC
iOS part of a flutter plugin for Square Reader SDK.
                       DESC
  s.homepage         = 'https://github.com/square/reader-sdk-flutter-plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Square, Inc.' => 'xiao@squareup.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.frameworks       = 'SquareReaderSDK'
  s.xcconfig         = { 'FRAMEWORK_SEARCH_PATHS' => '$(PROJECT_DIR)/../' }
  
  s.ios.deployment_target = '11.1'
end

