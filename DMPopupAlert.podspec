Pod::Spec.new do |s|

  s.name         = "DMPopupAlert"
  s.version      = "0.0.5"
  s.summary      = "Simple popup alert view."
  s.homepage     = "https://github.com/DimaAvvakumov/DMPopupAlert"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Dmitry Avvakumov" => "avvakumov@it-baker.ru" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/DimaAvvakumov/DMPopupAlert.git", :tag => "0.0.5" }
  s.source_files = "DMPopupAlert", "DMPopupAlert/*.{h,m}"
  s.public_header_files = "DMPopupAlert/*.{h,m}"
  s.framework    = "UIKit"
  s.requires_arc = true
  s.resources    = 'DMPopupAlert/DMPopupAlert.bundle'

end
