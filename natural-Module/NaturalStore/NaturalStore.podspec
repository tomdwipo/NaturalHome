Pod::Spec.new do |s|
s.name         = "NaturalStore"
s.version      = "0.0.1"
s.summary      = "Framework Application."
s.homepage     = "https://github.com/tommyputranto"
s.license      = "MIT (ios)"
s.author       = { "Tommy" => "tommyputranto1@gmail.com" }
s.social_media_url = "https://github.com/tommyputranto"
s.source       = { :git => "https://github.com/tommyputranto", :tag => "#{s.version}" }
s.source_files  = "NaturalStore/**/*.{h,m,swift}"
s.resource_bundles = {'NaturalStore' => ['NaturalStore/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png,plist}']}
s.resource = 'NaturalStore/Assets/**/*'
s.platform         = :ios, "9.0"
s.dependency 'BaseFramework'
s.dependency 'PagingMenuController'
end
