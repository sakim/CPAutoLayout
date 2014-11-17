#
# Be sure to run `pod lib lint CPAutoLayout.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CPAutoLayout"
  s.version          = "0.1.1"
  s.summary          = "position-based AutoLayout shorthand"
  s.description      = <<-DESC
                       CPAutoLayout is a position-based AutoLayout shorthand.
                       DESC
  s.homepage         = "https://github.com/sakim/CPAutoLayout"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Sung Ahn Kim" => "ccoroom@gmail.com" }
  s.source           = { :git => "https://github.com/sakim/CPAutoLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ccoroom'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'CPAutoLayout' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry'
end
