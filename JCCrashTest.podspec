
Pod::Spec.new do |s|

s.name         = "JCCrashTest"
s.version      = "0.0.1"
s.summary      = "crash小demo "
s.description  = "一个展示crash的小demo，能够通过邮箱发送crash日志给开发者"
s.homepage     = "https://github.com/RiversMaJianCheng/JCCrashTest"
s.license      = "MIT"
s.author             = { "majiancheng" => "“ma_jcheng@126.com”" }

s.platform     = :ios, "9.0"

s.source       = { :git => "https://github.com/RiversMaJianCheng/JCCrashTest.git", :tag => "#{s.version}" }
s.source_files  = "JCCrashTest", "JCCrashTest/**/*.{h,m}"
s.requires_arc = true

end
