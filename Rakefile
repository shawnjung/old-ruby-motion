# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'motion-testflight'
require 'sugarcube-common'
require 'teacup'
require 'sweettea'
require 'bubble-wrap'
require 'formotion'
#require 'motion-cocoapods'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'The Songs'
  app.version = '0.1.0'
  app.short_version = '1'
  app.identifier = 'ca.shawnjung.theSongs'
  #app.xcode_dir = '/Applications/Xcode 5.app/Contents/Developer'
  #app.sdk_version = '7.1'
  #app.deployment_target = '6.0'

  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = '2f54af3d8cd9b632b1e340b5bc344544_MTMwNTU0NTIwMTMtMDktMTQgMDc6NTI6MDQuODE3MjAy'
  app.testflight.team_token = '0bedee4b679185a2d6f7244b8c832fe8_MjcyNjMxMjAxMy0wOS0xNSAwMzoyODo1Ni4yODA3OTA'

  app.development do
    app.codesign_certificate = 'iPhone Developer: SangHyuk Jung (4PU44BZQW2)'
    app.provisioning_profile = './etc/The_Songs_Development.mobileprovision'
  end

  app.release do
    app.codesign_certificate = 'iPhone Distribution: SangHyuk Jung (9BL8D4X2Z9)'
    app.provisioning_profile = './etc/The_Songs_Beta.mobileprovision'
  end
end