#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'square_reader_sdk'
  s.version          = '2.1.0'
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
  s.xcconfig         = { 
    'FRAMEWORK_SEARCH_PATHS[sdk=iphoneos*]' => '$(PROJECT_DIR)/../SquareReaderSDK.xcframework/ios-arm64',
    'FRAMEWORK_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(PROJECT_DIR)/../SquareReaderSDK.xcframework/ios-x86_64-simulator'
  }
  
  s.ios.deployment_target = '11.1'
end

