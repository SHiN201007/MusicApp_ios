platform :ios, '10.0'
source 'https://github.com/CocoaPods/Specs.git'

def install_pods
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Firebase
  pod 'Firebase/Analytics'
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'FirebaseUI/Storage'
  pod 'Firebase/Messaging'
  pod 'Firebase/Functions'

  # Firebase Framework
  pod 'Pring'
  pod 'Muni'

  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxOptional'
  pod 'RxDataSources'
   
  # HUD
  pod "KRProgressHUD"
  # keyBoard suport
  pod 'IQKeyboardManagerSwift'
  # popup
  pod 'FFPopup'

end

target 'MusicApp_ios' do
  install_pods
end

target 'MusicApp_iosTests' do
 inherit! :search_paths
 # Pods for testing
end

target 'MusicApp_iosUITests' do
 # Pods for testing
end


swift3_names = [
]

swift4_names = [

]

swift42_names = [
]

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if swift4_names.include? target.name
        config.build_settings['SWIFT_VERSION'] = "4.0"
        elsif swift42_names.include? target.name
        config.build_settings['SWIFT_VERSION'] = "4.2"
        elsif swift3_names.include? target.name
        config.build_settings['SWIFT_VERSION'] = "3.0"
        else
        config.build_settings['SWIFT_VERSION'] = "5.0"
      end
    end
  end
end

