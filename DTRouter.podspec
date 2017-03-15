#
# Be sure to run `pod lib lint DTRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DTRouter'
  s.version          = '1.0.1'
  s.summary          = 'Lightweight modular framework'
  s.description      = <<-DESC
                        Lightweight modular framework
                       DESC
  s.homepage         = 'http://www.jianshu.com/u/62fd4a3ecff1'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DreamTracer' => 'jinqiucheng1006@live.cn' }
  s.source           = { :git => 'https://github.com/NicolasKim/DTRouter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.default_subspec = 'Core','UI'

  s.subspec 'Core' do |cs|
    cs.source_files = 'DTRouter/Classes/Core/*'
    cs.public_header_files = 'DTRouter/Classes/Core/*.h'
  end

  s.subspec 'UI' do |cs|
    cs.public_header_files = 'DTRouter/Classes/UIKitExtentsion/*.h'
    cs.source_files = 'DTRouter/Classes/UIKitExtentsion/*'
    cs.dependency 'DTRouter/Core'
  end
end
