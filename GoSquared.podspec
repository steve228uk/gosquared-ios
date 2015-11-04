Pod::Spec.new do |s|

  s.name             = "GoSquared"
  s.version          = "0.0.1"
  s.summary          = "Tracking SDK for integrating GoSquared in your iOS app."

  s.homepage         = "https://gosquared.com/"
  s.social_media_url = "https://twitter.com/gosquared"

  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Giles Williams" => "giles.williams@gmail.com",
                         "Ed Wellbrook"   => "edwellbrook@gmail.com" }

  s.platform         = :ios
  s.source           = { :git => "https://github.com/gosquared/gosquared-ios.git", :tag => "0.0.1" }

end
