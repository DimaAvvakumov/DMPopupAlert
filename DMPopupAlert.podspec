Pod::Spec.new do |s|

  s.name         = "DMPopupAlert"
  s.version      = "0.0.1"
  s.summary      = "Simple popup alert view."
  s.homepage     = "https://github.com/DimaAvvakumov/DMPopupAlert"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Dmitry Avvakumov" => "avvakumov@it-baker.ru" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/DimaAvvakumov/DMPopupAlert.git", :tag => "0.0.1" }
  s.source_files = "DMPopupAlert", "DMPopupAlert/*"
  s.public_header_files = "DMPopupAlert/*"
  s.framework    = "UIKit"
  s.requires_arc = true

end
