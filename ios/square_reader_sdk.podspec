#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'square_reader_sdk'
  s.version          = '1.7.2'
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
  s.xcconfig = {
    'OTHER_LDFLAGS' => '-framework SquareReaderSDK',
    'ENABLE_BITCODE' => 'NO',
    'FRAMEWORK_SEARCH_PATHS[sdk=iphoneos*]' => '$(inherited) $(PROJECT_DIR)/../SquareReaderSDK.xcframework/ios-arm64',
    'FRAMEWORK_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(inherited) $(PROJECT_DIR)/../SquareReaderSDK.xcframework/ios-arm64_x86_64-simulator'
  }
  s.vendored_frameworks = 'SquareReaderSDK.xcframework'
    # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
  }
  s.swift_version = '5.0'

  s.ios.deployment_target = '14.0'
end

