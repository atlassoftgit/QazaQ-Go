import UIKit
import Flutter
import YandexMapsMobile
// import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // GMSServices.provideAPIKey("")
    YMKMapKit.setApiKey("a0d7251f-ed10-43ce-805c-d0780b633ffd")
    


     let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

      let channel = FlutterMethodChannel(name: "samples.flutter.dev/battery", binaryMessenger: controller.binaryMessenger)

      let factory = FLNativeViewFactory(messenger: controller.binaryMessenger, channel: channel)
              self.registrar(forPlugin: "<plugin-name>")!.register(
                  factory,
                  withId: "<platform-view-type>")

                
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
