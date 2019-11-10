import Flutter
import UIKit
import Veriff

public class SwiftVeriffFlutterPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?


  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = SwiftVeriffFlutterPlugin()

    let channel = FlutterMethodChannel(name: "plugins.roji.io/veriff_flutter", binaryMessenger: registrar.messenger())
    let eventChannel = FlutterEventChannel(name: "plugins.roji.io/veriff_flutter_status", binaryMessenger: registrar.messenger())

    registrar.addMethodCallDelegate(instance, channel: channel)
    eventChannel.setStreamHandler(instance)
    Veriff.shared.delegate = instance
   
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    if call.method == "startAuthentication" {
      
      if let config = call.arguments as? Dictionary<String,Any>{
        
        let sessionToken = config["sessionToken"] as! String
        let veriffConf = VeriffConfiguration(sessionToken: sessionToken, sessionUrl: "https://magic.veriff.me")!
        let v = Veriff.shared
        
        
        v.set(configuration: veriffConf)
  //    let yourColor = UIColor.someColor()
  //    let yourImage = UIImage(named: “NavigationBarImageName.png”)
  //    conf.branding = Branding(themeColor: yourColor, navigationBarImage: yourImage)

        v.startAuthentication()
        } else {
        result("Argument Error")
      }

    


      // let arg: Dictionary<String, String> = call.arguments as! Dictionary<String, String>


/*
      let sessionToken = arg["sessionToken"]! as String

      let conf = VeriffConfiguration(sessionToken: sessionToken, sessionUrl: "https://magic.veriff.me")!
      let v = Veriff.shared
      v.set(configuration: conf)
  //    let yourColor = UIColor.someColor()
  //    let yourImage = UIImage(named: “NavigationBarImageName.png”)
  //    conf.branding = Branding(themeColor: yourColor, navigationBarImage: yourImage)

      v.startAuthentication()
*/
      result("") // TODO MAKE ERROR
    } else {
      result(FlutterMethodNotImplemented)
    }


  }

  public func onListen(withArguments arguments: Any?,
                       eventSink: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = eventSink

    return nil
  }

public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    eventSink = nil
    return nil
  }

}



extension SwiftVeriffFlutterPlugin: VeriffDelegate {
    public func onSession(result: VeriffResult, sessionToken: String) {
      guard let eventSink = eventSink else {
        return 
      }

      var code = "";

      switch result.code  {
         case .UNABLE_TO_ACCESS_CAMERA:
           code = "UNABLE_TO_ACCESS_CAMERA";
         case .STATUS_USER_CANCELED:
           code = "STATUS_USER_CANCELED";
         case .STATUS_SUBMITTED:
           code = "STATUS_SUBMITTED";
         case .STATUS_ERROR_SESSION:
           code = "STATUS_ERROR_SESSION";
         case .STATUS_ERROR_NETWORK:
           code = "STATUS_ERROR_NETWORK";
         case .STATUS_ERROR_NO_IDENTIFICATION_METHODS_AVAILABLE:
           code = "STATUS_ERROR_NO_IDENTIFICATION_METHODS_AVAILABLE";
         case .STATUS_DONE:
           code = "STATUS_DONE";
         case .STATUS_ERROR_UNKNOWN:
           code = "STATUS_ERROR_UNKNOWN";
         default:
           code = "UNSUPPORTED_RESULT";

      }
      eventSink(code)
    }
}