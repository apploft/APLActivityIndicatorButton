Pod::Spec.new do |s|

  s.name         = "APLActivityIndicatorButton"
  s.version      = "0.0.1"
  s.summary      = "This piece of information is pretty invalid"

  s.description  = <<-DESC
                   * APLActivityIndicatorButton is a UIView with a UIButton and an activityIndicator as Subviews.    
                   * The APLActivityIndicatorButton can be animated to display the activityIndicator to simulate loading UI.
                   DESC

  s.homepage     = "https://github.com/apploft/APLActivityIndicatorButton"
  
  s.swift_version = '5.0'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  s.author       = "Famara Kassama"
  
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/apploft/APLActivityIndicatorButton.git", :tag => s.version.to_s }

  s.source_files  = "APLActivityIndicatorButton", "APLActivityIndicatorButton/**/*.{swift}"
  
  s.framework  = "UIKit"
  s.requires_arc = true
  
end
