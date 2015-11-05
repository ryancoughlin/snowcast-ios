source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.4'
use_frameworks!

pod 'Alamofire'
pod 'PromiseKit'
pod 'Mapbox-iOS-SDK'

# disable bitcode in every sub-target
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end
