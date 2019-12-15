#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'veriff_flutter'
  s.version          = '0.1.0'
  s.summary          = 'Veriff integration for flutter'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/rojiio/veriff_flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Martin Wawrusch' => 'martin@wawrusch.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '11.0'
  s.static_framework = true
  s.dependency 'VeriffSDK', '>= 2.6.2'
end

