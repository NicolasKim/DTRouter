#
# Be sure to run `pod lib lint DTRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DTRouter'
  s.version          = '0.0.3'
  s.summary          = 'Lightweight modular framework'
  s.description      = <<-DESC
                        Lightweight modular framework
                       DESC
  s.homepage         = 'https://github.com/jinqiucheng1006@live.cn/DTRouter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DreamTracer' => 'jinqiucheng1006@live.cn' }
  s.source           = { :git => 'https://github.com/NicolasKim/DTRouter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
    s.default_subspec = 'Core','UI','Modular'
    s.public_header_files = 'DTRouter/Classes/Core/DTRouter.h'
    s.subspec 'Core' do |cs|
        cs.source_files = 'DTRouter/Classes/Core/*'
    end
    s.subspec 'UI' do |cs|
        cs.source_files = 'DTRouter/Classes/UIKitExtentsion/*'
        cs.dependency   'DTRouter/Core'
    end
    s.subspec 'Modular' do |cs|
        cs.source_files = 'DTRouter/Classes/Modular/*'
        cs.dependency   'DTRouter/Core'
    end
end
