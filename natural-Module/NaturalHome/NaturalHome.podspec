Pod::Spec.new do |s|
s.name         = "NaturalHome"
s.version      = "0.0.1"
s.summary      = "Framework Application."
s.homepage     = "https://github.com/tommyputranto"
s.license      = "MIT (ios)"
s.author       = { "Tommy" => "tommyputranto1@gmail.com" }
s.social_media_url = "https://github.com/tommyputranto"
s.source       = { :git => "https://github.com/tommyputranto", :tag => "#{s.version}" }
s.source_files  = "NaturalHome/**/*.{h,m,swift}"
s.resource_bundles = {'NaturalHome' => ['NaturalHome/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png,plist}']}
s.resource = 'NaturalHome/Assets/**/*'
s.platform         = :ios, "9.0"
s.dependency 'BaseFramework'
s.dependency 'ParallaxHeader'
end
