Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "CollapsibleTableHeaderView"
  s.version      = "0.1"
  s.summary      = "A collapsible section header for UITableView written in Swift."
  s.description  = <<-DESC
  This framework contains a Table View Header class that can be collapsed.
                   DESC
  s.homepage     = "https://github.com/TheFlow95/CollapsibleTableHeaderView"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "TheFlow" => "theflow@outlook.com" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "12.0"
  s.swift_version = "5.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/TheFlow95/CollapsibleTableHeaderView.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "CollapsibleTableHeaderView/CollapsibleTableHeaderView/Sources/**/*.swift"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.resource  = "CollapsibleTableHeaderView/CollapsibleTableHeaderView/Sources/Assets.xcassets"

end
